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

Future<bool> createMovmentRequest(
    DocumentReference createdBy,
    String userReported,
    String requestDescription,
    String carType,
    String carLicense) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Sectors collection
    QuerySnapshot snapshot = await firestore.collection('movmentRequest').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique sector ID
    int final_id = numDocuments + 1;
    String report_id = "Movment_Request_" + final_id.toString();
    // Create a new document in the Sectors collection
    await firestore.collection('movmentRequest').doc(report_id).set({
      "createdBy": createdBy,
      "createdTime": DateTime.now(),
      "carType": carType,
      "userReported": firestore.collection('users').doc(userReported),
      "carLicense": carLicense,
      "reportDescription": requestDescription,
    });

    print('movment Request created successfully!');
    return true;
  } catch (e) {
    print('Error creating movment Request: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
