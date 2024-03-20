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

Future<String> generateUserCode(String userRole) async {
  String userIDCategory = generateUserID(userRole);
  String endRange = '';
  String startRange = 'User_' + userIDCategory;
  if (userIDCategory == '11000') {
    endRange = 'infinity';
  } else {
    int tempNumber = int.parse(userIDCategory);
    int resultNumber = tempNumber + 999;
    endRange = 'User_$resultNumber';
  }
  int userCounts = await getDocumentCount(startRange, endRange);
  int tempNumber = int.parse(userIDCategory);
  int resultNumber = tempNumber + userCounts;
  return 'User_$resultNumber';
}

Future<int> getDocumentCount(String startRange, String endRange) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  QuerySnapshot querySnapshot;

  if (endRange == 'infinity') {
    querySnapshot = await users
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: startRange)
        .get();
  } else {
    querySnapshot = await users
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: startRange)
        .where(FieldPath.documentId, isLessThanOrEqualTo: endRange)
        .get();
  }

  return querySnapshot.size;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
