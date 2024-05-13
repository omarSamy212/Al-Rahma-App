const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.clearSessionWorkers = functions.https.onCall(async (data, context) => {
  console.log("Incoming request:", data);
  try {
    // Initialize Firestore instance (assuming you have service account credentials loaded)
    const db = admin.firestore();

    // Create a batch write object
    const batch = db.batch();

    // Clear worker lists in relevant collections
    const sectorsSnapshot = await db.collection("Sectors").get();
    sectorsSnapshot.forEach((sectorDoc) => {
      batch.update(sectorDoc.ref, { streetWorkersList: [] });
      console.log(`Clearing streetWorkersList for sector: ${sectorDoc.id}`);
    });

    const streetsSnapshot = await db.collection("Streets").get();
    streetsSnapshot.forEach((streetDoc) => {
      batch.update(streetDoc.ref, { assignedWorkers: [] });
      console.log(`Clearing assignedWorkers for street: ${streetDoc.id}`);
    });

    const leadersSnapshot = await db.collection("Leaders").get();
    leadersSnapshot.forEach((leaderDoc) => {
      batch.update(leaderDoc.ref, { availableWorkers: [], workers_List: [] });
      console.log(
        `Clearing availableWorkers and workers_List for leader: ${leaderDoc.id}`,
      );
    });

    const sessionsSnapshot = await db.collection("sessions").get();
    sessionsSnapshot.forEach((sessionDoc) => {
      batch.update(sessionDoc.ref, { workers_attended: [] });
      console.log(`Clearing workers_attended for session: ${sessionDoc.id}`);
    });

    // Commit the batch write
    await batch.commit();

    console.log("Worker lists cleared successfully");
    return { success: true };
  } catch (error) {
    console.error("Error clearing worker lists:", error);
    return { success: false, error: error.message };
  }
});
