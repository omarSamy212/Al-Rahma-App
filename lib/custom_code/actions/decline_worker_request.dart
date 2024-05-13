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

Future<bool> declineWorkerRequest(
    DocumentReference workerRequestRef, String comment) async {
  try {
    DocumentSnapshot workerRequestSnapshot = await workerRequestRef.get();

    // Check if the snapshot is not null
    if (workerRequestSnapshot != null) {
      // Get the current value of squaresList
      dynamic workerRequestData = workerRequestSnapshot.data();

      // Ensure that vehicleRequestData is not null and is a Map<String, dynamic>
      if (workerRequestData != null &&
          workerRequestData is Map<String, dynamic>) {
        // Ensure 'vehicleRequestComment' is not null before accessing it
        List<String> comments =
            List<String>.from(workerRequestData['workerRequestComment'] ?? []);

        // Update 'comments' with the new comment
        comments.add(comment);

        // Update vehicle request data
        await workerRequestRef.update({
          "isCompleted": true,
          "reportAcceptanceState": false,
          "workerRequestComment": comments,
        });
        return true;
      } else {
        // Handle the case where vehicleRequestData is null or not of type Map<String, dynamic>
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
    print('Error declining vehicle request: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
