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

Future<bool> acceptComplaint(
    DocumentReference complaintRef, String comment) async {
  try {
    // Update the squaresList field in the sector document
    DocumentSnapshot complaintSnapshot = await complaintRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic complaintData = complaintSnapshot.data();

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (complaintData != null && complaintData is Map<String, dynamic>) {
      int currentIndex = complaintData['currentReportStage'];
      List<String> comments =
          List<String>.from(complaintData['complaintComment']);
      comments.add(comment);
      debugPrint("Comments: " + comments.toString());
      debugPrint("current Report Stage index: " + currentIndex.toString());
      final CollectionReference reportsCollection =
          FirebaseFirestore.instance.collection('Reports');
      final DocumentSnapshot docSnapshot =
          await reportsCollection.doc('complaintReport').get();

      // Check if document exists
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;

        // Check if the 'reportStages' field exists
        if (data.containsKey('reportStages')) {
          final reportStages = data['reportStages'] as List;
          if (reportStages.length > currentIndex + 1) {
            await complaintRef.update({
              "currentReportStage": currentIndex + 1,
              "complaintComment": comments,
            });
          } else {
            await complaintRef.update({
              "isCompleted": true,
              "reportAcceptanceState": true,
              "complaintComment": comments,
            });
          }
        } else {
          // 'reportStages' field not found
          await complaintRef.update({'currentReportStage': currentIndex + 1});
        }
      } else {
        // Document not found
        await complaintRef.update({'currentReportStage': currentIndex + 1});
      }
      return true;
      // Update the squaresList field in the sector document with the updated array
    } else {
      print(
          'Error: Unable to retrieve currentStage data from the complaint document.');
      return false;
    }
  } catch (e) {
    print('Error creating square: $e');
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
