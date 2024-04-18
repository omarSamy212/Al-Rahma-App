// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> createLeader(String leaderName, String squareID) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Squares collection
    QuerySnapshot snapshot = await firestore.collection('Leaders').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique square ID
    String leaderID = 'Leader_${numDocuments + 1}';
    DocumentReference squareRef = firestore.collection('Squares').doc(squareID);

    // Create a new document in the Squares collection
    await firestore.collection('Leaders').doc(leaderID).set({
      'leaderName': leaderName,
      'leaderID': leaderID,
      'streetsList': [], // Initialize with an empty list
      'squareRefrence': squareRef,
    });

    // Get reference to the sector document

    // Update the squaresList field in the sector document
    DocumentSnapshot squareSnapshot = await squareRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic squaresListData = squareSnapshot.data();

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

    print('leader created successfully!');
  } catch (e) {
    print('Error creating square: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
