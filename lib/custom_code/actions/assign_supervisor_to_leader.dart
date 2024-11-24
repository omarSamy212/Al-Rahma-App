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

Future<bool> assignSupervisorToLeader(
  String leaderRefrence,
  String sectorRefrence,
  String mainSupervisorRefrence,
  DocumentReference? oldSector,
  DocumentReference? oldLeaderMain,
) async {
  try {
    if (oldSector != null) {
      DocumentSnapshot oldSectorSnapshot = await oldSector.get();
      dynamic oldSectorData = oldSectorSnapshot.data();

      if (oldSectorData != null && oldSectorData['supervisors'] != null) {
        List<dynamic> currentSupervisorsList =
            List.from(oldSectorData['supervisors']);
        currentSupervisorsList.removeWhere((supervisor) =>
            supervisor ==
            FirebaseFirestore.instance
                .collection('users')
                .doc('User_$mainSupervisorRefrence'));
        await oldSector.update({'supervisors': currentSupervisorsList});
      }
    }

    // Remove old references from the old leader document
    if (oldLeaderMain != null) {
      await oldLeaderMain.update({
        'supervisorMain': null,
      });
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference sectorRef =
        firestore.collection('Sectors').doc(sectorRefrence);
    DocumentSnapshot sectorSnapshot = await sectorRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic sectorData = sectorSnapshot.data();

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (sectorData != null && sectorData is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      List<dynamic>? currentSupervisorsList = sectorData['supervisors'];

      // Ensure that currentSquaresList is not null
      if (currentSupervisorsList == null) {
        currentSupervisorsList = [];
      }

      // Append the new square reference to the current squaresList
      currentSupervisorsList
          .add(firestore.doc('users/User_$mainSupervisorRefrence'));
      await sectorRef.update({'supervisors': currentSupervisorsList});
      DocumentReference leaderRef =
          firestore.collection('Leaders').doc(leaderRefrence);

      await leaderRef.update({
        'supervisorMain': FirebaseFirestore.instance
            .collection('users')
            .doc('User_$mainSupervisorRefrence'),
      });

      DocumentReference mainUserRef =
          firestore.collection('users').doc('User_$mainSupervisorRefrence');

      await mainUserRef.update({
        'leaderAreaRefrence1': FirebaseFirestore.instance
            .collection('Leaders')
            .doc(leaderRefrence),
      });
    }
    return true;
  } catch (e) {
    print('Error assign supervisor: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
