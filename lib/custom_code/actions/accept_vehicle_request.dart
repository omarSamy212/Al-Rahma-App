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

Future<bool> acceptVehicleRequest(
    DocumentReference vehicleRequestRef, String comment) async {
  print('vehicleRequestRef: $vehicleRequestRef');
  print('comment: $comment');
  try {
    // Update the squaresList field in the sector document
    DocumentSnapshot vehicleRequestSnapshot = await vehicleRequestRef.get();

    // Check if the snapshot is not null
    if (vehicleRequestSnapshot != null) {
      // Get the current value of squaresList
      dynamic vehicleRequestData = vehicleRequestSnapshot.data();

      // Check if vehicleRequestData is not null and is a Map<String, dynamic>
      if (vehicleRequestData != null &&
          vehicleRequestData is Map<String, dynamic>) {
        int currentIndex = vehicleRequestData['currentReportStage'];

        // Ensure 'vehicleRequestComment' is not null before accessing it
        List<String> comments = List<String>.from(
            vehicleRequestData['vehicleRequestComment'] ?? []);

        // Update 'comments' with the new comment
        comments.add(comment);

        final CollectionReference reportsCollection =
            FirebaseFirestore.instance.collection('Reports');
        final DocumentSnapshot docSnapshot =
            await reportsCollection.doc('vehicleRequest').get();

        // Check if document exists
        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>;

          // Check if the 'reportStages' field exists
          if (data.containsKey('reportStages')) {
            final reportStages = data['reportStages'] as List;
            if (reportStages.length > currentIndex + 1) {
              await vehicleRequestRef.update({
                "currentReportStage": currentIndex + 1,
                "complaintComment": comments,
              });
            } else {
              await vehicleRequestRef.update({
                "isCompleted": true,
                "reportAcceptanceState": true,
                "complaintComment": comments,
              });
            }
          } else {
            // 'reportStages' field not found
            await vehicleRequestRef
                .update({'currentReportStage': currentIndex + 1});
          }
        } else {
          // Document not found
          await vehicleRequestRef
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
