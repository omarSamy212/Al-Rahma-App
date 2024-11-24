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

Future<bool> createWorkerRequest(
    DocumentReference createdBy,
    String requestType,
    String requestDescription,
    String requestStreet,
    int numberOfitems) async {
  debugPrint('requestType : $requestType');
  debugPrint('createdBy : $createdBy');
  debugPrint('requestStreet : $requestStreet');
  debugPrint('numberOfitems : $numberOfitems');
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Sectors collection
    QuerySnapshot snapshot = await firestore.collection('WorkerRequest').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique sector ID
    int final_id = numDocuments + 1;
    String report_id = "Worker_Request_" + final_id.toString();
    // Create a new document in the Sectors collection
    await firestore.collection('WorkerRequest').doc(report_id).set({
      "createdBy": createdBy,
      "requestType": requestType,
      "reportType":
          FirebaseFirestore.instance.collection('Reports').doc("workerRequest"),
      "requestStreet":
          FirebaseFirestore.instance.collection('Streets').doc(requestStreet),
      "numberOfitems": numberOfitems,
      "requestDescription": requestDescription,
      "createdTime": DateTime.now(),
      "isCompleted": false,
      "reportAcceptanceState": false,
      "currentReportStage": 0,
      "workerRequestComment": [],
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
