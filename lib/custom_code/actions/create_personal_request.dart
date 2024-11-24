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

Future<bool> createPersonalRequest(String reportReason, String reportDetails,
    DocumentReference createdBy) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the PersonalRequests collection
    QuerySnapshot snapshot =
        await firestore.collection('PersonalRequests').get();
    int numDocuments = snapshot.docs.length;

    final documentSnapshot =
        await firestore.collection('Reports').doc('personalRequest').get();
    List<PersonalRequestUserResponsStruct> reportStagesMap = [];
    if (documentSnapshot.exists) {
      // Extract reportStages array
      final reportStagesArray =
          List<String>.from(documentSnapshot.data()?['reportStages'] ?? []);

      // Create map with reportStages as keys
      reportStagesArray.forEach((stage) {
        PersonalRequestUserResponsStruct temp =
            new PersonalRequestUserResponsStruct(
                userRole: stage, response: "Pending");
        reportStagesMap.add(temp);
      });
    }

    // Generate a unique report ID
    String report_id = "Personal_Request_${numDocuments + 1}";
    // Create a new document with data type checks
    await firestore.collection('PersonalRequests').doc(report_id).set({
      "reportReason": reportReason,
      "reportDetails": reportDetails,
      "reportType": firestore.collection('Reports').doc("personalRequest"),
      "createdBy": createdBy,
      "createdTime": DateTime.now(),
      "isCompleted": false,
      "reportAcceptanceState": false,
      "currentReportStage": 0,
      "userRespons": reportStagesMap.map((item) {
        Map<String, dynamic> map = {
          'userRole': item.userRole,
          'response': item.response,
          // Add other fields as needed
        };
        return map;
      }).toList(),
    });

    print('Personal request created successfully!');
    return true;
  } catch (e) {
    if (e is FirebaseException) {
      print('Firestore error: ${e.message}');
    } else {
      print('Error creating personal request: $e');
    }
    return false;
  }
}
