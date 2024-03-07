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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference?> getUserRef(String docID) async {
  // use argument document id to return a refrence from the users collection
// Import necessary packages

// Create a reference to the users collection
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

// Get the document reference using the provided docID
  DocumentReference userDocRef = usersRef.doc(docID);

// Check if the document exists
  DocumentSnapshot userDocSnapshot = await userDocRef.get();
  if (!userDocSnapshot.exists) {
    return null;
  }

  return userDocRef;
}
