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

Future<bool> acceptWorkerRequest(
    DocumentReference workerRequestRef, String comment) async {
  try {
    // Update the squaresList field in the sector document
    DocumentSnapshot workerRequestSnapshot = await workerRequestRef.get();

    // Check if the snapshot is not null
    if (workerRequestSnapshot != null) {
      // Get the current value of squaresList
      dynamic workerRequestData = workerRequestSnapshot.data();

      // Check if vehicleRequestData is not null and is a Map<String, dynamic>
      if (workerRequestData != null &&
          workerRequestData is Map<String, dynamic>) {
        int currentIndex = workerRequestData['currentReportStage'];

        // Ensure 'vehicleRequestComment' is not null before accessing it
        List<String> comments =
            List<String>.from(workerRequestData['workerRequestComment'] ?? []);

        // Update 'comments' with the new comment
        comments.add(comment);

        final CollectionReference reportsCollection =
            FirebaseFirestore.instance.collection('Reports');
        final DocumentSnapshot docSnapshot =
            await reportsCollection.doc('workerRequest').get();

        // Check if document exists
        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>;

          // Check if the 'reportStages' field exists
          if (data.containsKey('reportStages')) {
            final reportStages = data['reportStages'] as List;
            if (reportStages.length > currentIndex + 1) {
              await workerRequestRef.update({
                "currentReportStage": currentIndex + 1,
                "complaintComment": comments,
              });
            } else {
              await workerRequestRef.update({
                "isCompleted": true,
                "reportAcceptanceState": true,
                "complaintComment": comments,
              });
            }
          } else {
            // 'reportStages' field not found
            await workerRequestRef
                .update({'currentReportStage': currentIndex + 1});
          }
        } else {
          // Document not found
          await workerRequestRef
              .update({'currentReportStage': currentIndex + 1});
        }
        return true;
        // Update the squaresList field in the sector document with the updated array
      } else {
        // Handle the case where vehicleRequestData is null or not a Map<String, dynamic>
        print(
            'Vehicle request data is null or not of type Map<String, dynamic>');
        return false;
      }
    } else {
      // Handle the case where vehicleRequestSnapshot is null
      print('Vehicle request snapshot is null');
      return false;
    }
  } catch (e) {
    // Handle any errors that occur during the process
    print('error accepting request: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
