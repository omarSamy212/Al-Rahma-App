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

DocumentReference gettingUserRefrenceFromOldLoginData(String email) {
  // Get a reference to the Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a reference to the document using its ID
  String documentId = "User_";
  int atIndex = email.indexOf('@');

  // If '@' symbol exists, return substring up to that index
  if (atIndex != -1) {
    documentId = documentId + email.substring(0, atIndex);
  } else {
    documentId = documentId + email;
  }
  DocumentReference documentReference =
      firestore.collection('users').doc(documentId);

  // Return the document reference
  return documentReference;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
