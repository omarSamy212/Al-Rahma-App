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

Future<ShiftStruct?> createShift(String shiftPeriod, String startShift) async {
  try {
    // Assuming ShiftType is a class
    ShiftStruct shiftType = ShiftStruct(
      shiftPeriod: shiftPeriod,
      startShift: startShift,
    );
    return shiftType;
  } catch (e) {
    // Handle error, such as logging or returning an error message.
    print('Error in createShiftType: $e');
    return null; // Return null or handle error accordingly.
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
