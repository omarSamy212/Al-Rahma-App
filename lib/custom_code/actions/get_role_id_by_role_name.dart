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

Future<String?> getRoleIdByRoleName(String roleName) async {
  debugPrint("Role name: " + '$roleName');
  try {
    // Access the Firestore collection "Roles"
    var rolesCollection = FirebaseFirestore.instance.collection('Roles');

    // Query Firestore to get the document where roleName equals the input string
    var querySnapshot =
        await rolesCollection.where('roleName', isEqualTo: roleName).get();

    // Check if any document matches the query
    if (querySnapshot.docs.isNotEmpty) {
      // Get the first document found
      var document = querySnapshot.docs.first;

      // Access the "roleID" field from the document
      var roleId = document['roleID'];

      // Return the roleID
      debugPrint("Role returned: " + '$roleId');
      return roleId;
    } else {
      // If no document matches the query, return null
      debugPrint("no documents found");
      return null;
    }
  } catch (e) {
    // Handle any errors that occur during the process
    print('Error fetching role ID: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
