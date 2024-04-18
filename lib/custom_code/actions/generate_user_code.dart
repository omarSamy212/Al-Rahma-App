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
  if (userIDCategory == '7000') {
    endRange = 'infinity';
  } else {
    int tempNumber = int.parse(userIDCategory);
    int resultNumber = tempNumber + 5999;
    endRange = 'User_$resultNumber';
  }
  debugPrint("start range: " + '$startRange');
  debugPrint("end range: " + '$endRange');
  int userCounts = await getDocumentCount(startRange, endRange);
  int tempNumber = int.parse(userIDCategory);
  int resultNumber = tempNumber + userCounts;
  debugPrint("resultNumber of ID: " + '$resultNumber');
  debugPrint("userCounts of ID: " + '$userCounts');
  debugPrint("tempNumber of ID: " + '$tempNumber');
  String tempvalue = resultNumber.toString().padLeft(4, '0');
  debugPrint("Final result: " + '$tempvalue');
  return tempvalue;
}

Future<int> getDocumentCount(String startRange, String endRange) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  QuerySnapshot querySnapshot;

  if (endRange == 'User_infinity') {
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
