// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<UserPrivilegesStruct?> createPrivilige(
    String roleID, String roleName) async {
  try {
    List<DocumentReference>? privileges = await grantUserRole(roleID);
    if (privileges != null) {
      UserPrivilegesStruct privilegesStruct = UserPrivilegesStruct(
        grantedPrivilege: privileges,
        roleName: roleName,
      );
      return privilegesStruct;
    } else {
      return null;
    }
  } catch (e) {
    // Handle error, such as logging or returning an error message.
    print('Error in createPrivilige: $e');
    return null; // Return null or handle error accordingly.
  }
}

Future<List<DocumentReference>?> grantUserRole(String roleID) async {
  try {
    // Fetch tasks for the specified role ID
    String roleMap = "Role_" + roleID + "_Map";
    debugPrint('Role map ID: $roleMap');
    final tasksSnapshot = await FirebaseFirestore.instance
        .collection("Role_Mapping")
        .doc(roleMap)
        .get();

    // Check if data exists in the snapshot
    if (tasksSnapshot.exists) {
      // Extract tasks list from snapshot data
      final tasksList = tasksSnapshot.data()?['Tasks'] as List<dynamic>;

      // Check if tasksList is not null and is a List
      if (tasksList != null && tasksList is List) {
        // Convert each task ID to a DocumentReference
        final List<DocumentReference<Object?>> references = tasksList
            .where((taskDocRef) =>
                taskDocRef is DocumentReference || taskDocRef is String)
            .map<DocumentReference<Object?>>((taskDocRef) {
          if (taskDocRef is DocumentReference) {
            return taskDocRef
                as DocumentReference<Object?>; // Cast to non-nullable type
          } else if (taskDocRef is String) {
            return FirebaseFirestore.instance
                    .collection("tasks")
                    .doc(taskDocRef)
                as DocumentReference<Object?>; // Cast to non-nullable type
          } else {
            // This branch should never be reached if the filter is correct, but you can handle it if needed
            throw ArgumentError('Invalid task document reference: $taskDocRef');
          }
        }).toList();

        // Remove null values (if any) from the list
        references.removeWhere((ref) => ref == null);

        debugPrint('Tasks List: $tasksList');
        debugPrint('Document References: $references');
        return references;
      } else {
        debugPrint('Error: tasksList is null or not a List');
        return null;
      }
    } else {
      debugPrint('Error: Snapshot does not exist');
      return null;
    }
  } catch (error, stackTrace) {
    debugPrint('Error updating privileges: $error');
    debugPrint('Stack Trace: $stackTrace');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
