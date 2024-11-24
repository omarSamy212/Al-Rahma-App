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

Future<UsersRecord?> getUserDocumentFromID(String userID) async {
  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    if (userDoc.exists) {
      // The leader document exists, so we can return it
      UsersRecord user = UsersRecord.fromSnapshot(userDoc);

      debugPrint(user.toString());
      return user;
    } else {
      // The leader document does not exist, so we can return null or throw an error
      return null;
    }
  } catch (e) {
    print('error getting user: $e');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
