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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> createSector(String sectorName) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Sectors collection
    QuerySnapshot snapshot = await firestore.collection('Sectors').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique sector ID
    String sectorId = 'Sector_${numDocuments + 1}';

    // Create a new document in the Sectors collection
    await firestore.collection('Sectors').doc(sectorId).set({
      'sectorName': sectorName,
      'squaresList': [], // Initialize with an empty list
      'sectorID': sectorId,
      'numOfNeededSupervisors': 0,
      'numOfNeededWorkers': 0,
    });

    return true;
  } catch (e) {
    print('Error creating sector: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
