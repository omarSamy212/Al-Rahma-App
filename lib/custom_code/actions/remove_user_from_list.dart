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

Future<List<UsersRecord>> removeUserFromList(
    List<UsersRecord> userList, String inputUserCode) async {
  // take a userCode and users document length and remove from the list the user where user code

  final filteredList = <UsersRecord>[];
  int i = 0;
  for (final user in userList) {
    if (user.userCode != inputUserCode) {
      filteredList.add(user);
    }
    i++;
  }
  return filteredList;
}
