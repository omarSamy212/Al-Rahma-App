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

Future<List<UsersRecord>> getDocsFromRefs(
    List<DocumentReference> userRefList) async {
  try {
    // List to store user records
    List<UsersRecord> usersRecords = [];

    // Firestore reference to the users collection
    final usersCollection = FirebaseFirestore.instance.collection('users');

    // Iterate through the list of user references
    for (var userRef in userRefList) {
      // Get the document snapshot for the current user reference
      DocumentSnapshot snapshot = await userRef.get();

      // Convert the document snapshot to a UsersRecord instance
      UsersRecord userRecord = UsersRecord.fromSnapshot(snapshot);

      // Add the user record to the list
      usersRecords.add(userRecord);
    }

    return usersRecords;
  } catch (e) {
    // Handle errors if any
    print('Error fetching user records: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
