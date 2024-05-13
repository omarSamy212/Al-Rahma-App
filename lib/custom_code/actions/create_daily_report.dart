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

Future<bool> createDailyReport(
  String sweepCondition,
  String dustStrippingCondition,
  String wasteRemovalCondition,
  String sectionNeeds,
  String stateOfHostility,
  DocumentReference createdBy,
  DocumentReference? leader,
  DocumentReference? sector,
) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Sectors collection
    QuerySnapshot snapshot = await firestore.collection('Daily_Reports').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique sector ID
    String daily_report_id = 'DailyReport_${numDocuments + 1}';

    // Create a new document in the Sectors collection
    await firestore.collection('Daily_Reports').doc(daily_report_id).set({
      'sweepCondition': sweepCondition,
      'dustStrippingCondition':
          dustStrippingCondition, // Initialize with an empty list
      'wasteRemovalCondition': wasteRemovalCondition,
      'sectionNeeds': sectionNeeds,
      'stateOfHostility': stateOfHostility,
      'createdBy': createdBy,
      'leader': leader,
      'sector': sector,
      'createdTime': DateTime.now(),
      "isMarked": false,
      "isReviewed": false,
    });

    print('daily report created successfully!');
    return true;
  } catch (e) {
    print('Error creating daily report: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
