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

Future<List<PersonalRequestUserResponsStruct>?> declinePersonalRequest(
    DocumentReference personalRequestRef, String roleName) async {
  try {
    await personalRequestRef.update({
      "isCompleted": true,
      "reportAcceptanceState": false,
    });
    DocumentSnapshot personalRequestSnapshot = await personalRequestRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic personalRequestData = personalRequestSnapshot.data();

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (personalRequestData != null &&
        personalRequestData is Map<String, dynamic>) {
      List<PersonalRequestUserResponsStruct> data =
          (personalRequestData['userRespons'] as List<dynamic>)
              .map((item) => PersonalRequestUserResponsStruct.fromMap(item))
              .toList();
      for (PersonalRequestUserResponsStruct item in data) {
        if (item.userRole == roleName) {
          item.response = "Rejected";
        }
      }

      return data;
      // Update the squaresList field in the sector document with the updated array
    } else {
      return null;
    }
  } catch (e) {
    print('Error creating square: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
