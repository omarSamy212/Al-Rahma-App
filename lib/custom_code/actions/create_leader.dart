// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> createLeader(String leaderName, String squareID,
    String leaderDescription, String leaderOldName, String sectorID) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Squares collection
    QuerySnapshot snapshot = await firestore.collection('Leaders').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique square ID
    String leaderID = 'Leader_${numDocuments + 1}';
    DocumentReference squareRef = firestore.collection('Squares').doc(squareID);
    DocumentReference sectorRef = firestore.collection('Sectors').doc(sectorID);

    // Create a new document in the Squares collection
    await firestore.collection('Leaders').doc(leaderID).set({
      'leaderName': leaderName,
      'leaderID': leaderID,
      'streetsList': [], // Initialize with an empty list
      'squareRefrence': squareRef,
      'leaderDescription': leaderDescription,
      'supervisorMain': null,
      'supervisorSecondary': null,
      'leaderOldName': leaderOldName,
      'sectorID': sectorID,
    });

    // Get reference to the sector document

    // Update the squaresList field in the sector document
    DocumentSnapshot squareSnapshot = await squareRef.get();
    DocumentSnapshot sectorSnapshot = await sectorRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic squaresListData = squareSnapshot.data();
    dynamic sectorSupervisorNeeded = sectorSnapshot.data();

    if (sectorSupervisorNeeded != null &&
        sectorSupervisorNeeded is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      int? currentSupervisorsNeeeded =
          sectorSupervisorNeeded['numOfNeededSupervisors'];

      // Ensure that currentSquaresList is not null
      if (currentSupervisorsNeeeded == null) {
        currentSupervisorsNeeeded = 0;
      }

      // Append the new square reference to the current squaresList
      currentSupervisorsNeeeded = currentSupervisorsNeeeded + 1;

      // Update the squaresList field in the sector document with the updated array
      await sectorRef
          .update({'numOfNeededSupervisors': currentSupervisorsNeeeded});
    } else {
      print(
          'Error: Unable to retrieve leadersList data from the sector document.');
    }

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (squaresListData != null && squaresListData is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      List<dynamic>? currentLeadersList = squaresListData['leadersList'];

      // Ensure that currentSquaresList is not null
      if (currentLeadersList == null) {
        currentLeadersList = [];
      }

      // Append the new square reference to the current squaresList
      currentLeadersList.add(firestore.doc('Leaders/$leaderID'));

      // Update the squaresList field in the sector document with the updated array
      await squareRef.update({'leadersList': currentLeadersList});
    } else {
      print(
          'Error: Unable to retrieve leadersList data from the sector document.');
    }

    return true;
  } catch (e) {
    print('Error creating square: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
