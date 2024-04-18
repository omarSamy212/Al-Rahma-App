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

Future<void> createSquare(String squareName, String sectorID) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Squares collection
    QuerySnapshot snapshot = await firestore.collection('Squares').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique square ID
    String squareID = 'Square_${numDocuments + 1}';
    DocumentReference sectorRef = firestore.collection('Sectors').doc(sectorID);

    // Create a new document in the Squares collection
    await firestore.collection('Squares').doc(squareID).set({
      'squareName': squareName,
      'squareID': squareID,
      'leaderList': [], // Initialize with an empty list
      'sectorRefrence': sectorRef,
    });

    // Get reference to the sector document

    // Update the squaresList field in the sector document
    DocumentSnapshot sectorSnapshot = await sectorRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic squaresListData = sectorSnapshot.data();

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (squaresListData != null && squaresListData is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      List<dynamic>? currentSquaresList = squaresListData['squaresList'];

      // Ensure that currentSquaresList is not null
      if (currentSquaresList == null) {
        currentSquaresList = [];
      }

      // Append the new square reference to the current squaresList
      currentSquaresList.add(firestore.doc('Squares/$squareID'));

      // Update the squaresList field in the sector document with the updated array
      await sectorRef.update({'squaresList': currentSquaresList});
    } else {
      print(
          'Error: Unable to retrieve squaresList data from the sector document.');
    }

    print('Square created successfully!');
  } catch (e) {
    print('Error creating square: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
