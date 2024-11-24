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

Future<bool> declineComplaint(
    DocumentReference complaintRef, String comment) async {
  try {
    DocumentSnapshot complaintSnapshot = await complaintRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic complaintData = complaintSnapshot.data();

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (complaintData != null && complaintData is Map<String, dynamic>) {
      List<String> comments =
          List<String>.from(complaintData['complaintComment']);
      comments.add(comment);
      await complaintRef.update({
        "isCompleted": true,
        "reportAcceptanceState": false,
        "complaintComment": comments,
      });
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Error creating square: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
