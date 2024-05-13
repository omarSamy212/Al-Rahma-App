// Imports and initialization
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const db = admin.firestore();

// Cloud Function Trigger
exports.distributeWorkers = functions.pubsub
  .schedule("1 7 * * *")
  .timeZone("Africa/Cairo")
  .onRun(async (context) => {
    const sectorID = context.data.sectorID;
    try {
      const sector = await retrieveSector(sectorID); // Step 1: Retrieve sector document
      const squares = await retrieveSquares(sector.squaresList); // Step 2: Retrieve squares references
      const workers = await retrieveWorkers(sector.streetWorkersList); // Step 3: Retrieve workers list
      distributeWorkers(squares, workers); // Step 4: Distribute workers across leader areas
      await updateFirestore(squares); // Step 5: Update Firestore with assigned workers
      console.log("Worker distribution completed."); // Step 6: Log completion message
    } catch (error) {
      console.error("Error distributing workers:", error);
      throw error;
    }
  });

// Retrieve Sector Document
async function retrieveSector(sectorID) {
  try {
    const sectorSnapshot = await db.collection("sectors").doc(sectorID).get();
    return sectorSnapshot.data();
  } catch (error) {
    console.error("Error retrieving sector:", error);
    throw error;
  }
}

// Retrieve Squares References
async function retrieveSquares(squaresList) {
  try {
    const squares = [];
    for (const squareRef of squaresList) {
      const squareSnapshot = await squareRef.get();
      squares.push({ id: squareSnapshot.id, data: squareSnapshot.data() });
    }
    return squares;
  } catch (error) {
    console.error("Error retrieving squares:", error);
    throw error;
  }
}

// Retrieve Workers List
async function retrieveWorkers(streetWorkersList) {
  try {
    const workers = [];
    for (const workerRef of streetWorkersList) {
      const workerSnapshot = await workerRef.get();
      workers.push({ id: workerSnapshot.id, data: workerSnapshot.data() });
    }
    return workers;
  } catch (error) {
    console.error("Error retrieving workers:", error);
    throw error;
  }
}

// Distribute Workers across Leader Areas
function distributeWorkers(squares, workers) {
  let totalWorkers = workers.length;
  let totalNeededWorkers = 0;

  squares.forEach((square) => {
    totalNeededWorkers += square.data.numOfNeededWokers;
  });

  const neededWorkersThreshold = 0.7 * totalNeededWorkers;

  squares.forEach((square) => {
    const leaderAreas = square.data.leadersList.length;
    const neededWorkersPerArea = Math.ceil(
      square.data.numOfNeededWokers / leaderAreas,
    );
    let workersPerArea = Math.min(
      neededWorkersPerArea,
      Math.ceil(totalWorkers / leaderAreas),
    );

    // Ensure at least 70% of needed workers are assigned
    if (workersPerArea < 0.7 * neededWorkersPerArea) {
      workersPerArea = Math.ceil(0.7 * neededWorkersPerArea);
    }

    square.data.leadersList.forEach((leader) => {
      const workersToAssign = Math.min(workersPerArea, totalWorkers);
      leader.data.workers = workers.splice(0, workersToAssign); // Step 7: Assign workers to leader area
      totalWorkers -= workersToAssign;
    });
  });
}

// Update Firestore with assigned workers for each Leader Area
async function updateFirestore(squares) {
  const batch = db.batch();
  squares.forEach((square) => {
    square.data.leadersList.forEach((leader) => {
      const leaderRef = db.collection("leaders").doc(leader.id);
      const workersRefs = leader.data.workers.map((worker) =>
        db.doc(`users/${worker.id}`),
      );
      batch.update(leaderRef, { workers_list: workersRefs }); // Step 8: Update Firestore with workers references
    });
  });

  await batch.commit();
}
