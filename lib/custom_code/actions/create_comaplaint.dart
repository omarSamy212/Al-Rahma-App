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

import 'package:flutter/foundation.dart';

Future<bool> createComaplaint(
    String reportReason,
    String reportDetails,
    DocumentReference createdBy,
    String? imageUrl1,
    String? imageUrl2,
    String? imageUrl3,
    DocumentReference userReported,
    DocumentReference userReportedSupplier) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Sectors collection
    QuerySnapshot snapshot = await firestore.collection('Complaints').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique sector ID
    int final_id = numDocuments + 1;
    String report_id = "Complaint_Report_" + final_id.toString();
    List<String> imageUrlList = [];
    if (imageUrl1 != null && imageUrl1 != "") {
      imageUrlList.add(imageUrl1);
    }

    if (imageUrl2 != null && imageUrl2 != "") {
      imageUrlList.add(imageUrl2);
    }

    if (imageUrl3 != null && imageUrl3 != "") {
      imageUrlList.add(imageUrl3);
    }

    debugPrint("Image list: " + imageUrlList.toString());

    // Create a new document in the Sectors collection
    await firestore.collection('Complaints').doc(report_id).set({
      "reportReason": reportReason,
      "reportDetails": reportDetails,
      "reportType": FirebaseFirestore.instance
          .collection('Reports')
          .doc("complaintReport"),
      "createdBy": createdBy,
      "images": imageUrlList,
      "userReported": userReported,
      "createdTime": DateTime.now(),
      "isCompleted": false,
      "reportAcceptanceState": false,
      "currentReportStage": 0,
      "complaintComment": [],
      "userReportedSupplier": userReportedSupplier,
    });

    print('Sector created successfully!');
    return true;
  } catch (e) {
    print('Error creating sector: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
