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

Future<List<DocumentReference>> getAttendanceRecords(
  DocumentReference? sessionRef,
  DocumentReference? sectorRef,
) async {
  // Create a reference to the Checks collection
  final checksCollection = FirebaseFirestore.instance.collection('checks');

  // Build the query based on the provided parameters
  final query = checksCollection
      .where('session_id', isEqualTo: sessionRef)
      .where('sector', isEqualTo: sectorRef);

  // Execute the query and get the snapshot
  final snapshot = await query.get();

  // Extract document references from the retrieved documents
  final attendanceRecords = snapshot.docs.map((doc) => doc.reference).toList();

  return attendanceRecords;
}
