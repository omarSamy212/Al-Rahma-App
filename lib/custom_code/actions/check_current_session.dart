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

import 'package:intl/intl.dart';

Future<CurrentShiftInfoStruct?> checkCurrentSession() async {
  try {
    // Firestore reference for the sessions collection
    final CollectionReference sessionsCollection =
        FirebaseFirestore.instance.collection('sessions');

    // Get current time
    final now = DateTime.now();

    // Fetch all sessions from Firestore
    final snapshot = await sessionsCollection.get();

    // Check if any sessions were retrieved
    if (snapshot.docs.isNotEmpty) {
      for (final doc in snapshot.docs) {
        // Extract start and end times from the document (assuming they are Timestamps)
        final startTime = doc['start_time'] as Timestamp;
        final endTime = doc['end_time'] as Timestamp;

        // Extract TimeOfDay objects (assuming sessions are already in UTC+2)
        final startTimeOnly = TimeOfDay.fromDateTime(startTime.toDate());
        final endTimeOnly = TimeOfDay.fromDateTime(endTime.toDate());

        // Check if the current time falls within the session's time range
        if ((startTimeOnly.hour < endTimeOnly.hour &&
                now.hour >= startTimeOnly.hour &&
                now.hour < endTimeOnly.hour) ||
            (startTimeOnly.hour > endTimeOnly.hour &&
                (now.hour >= startTimeOnly.hour ||
                    now.hour < endTimeOnly.hour)) ||
            (startTimeOnly.hour == endTimeOnly.hour &&
                (now.minute >= startTimeOnly.minute ||
                    now.minute < endTimeOnly.minute))) {
          final sessionName = doc['session_name'];
          return CurrentShiftInfoStruct(
              sessionName: sessionName, sessionDocRef: doc.reference);
        }
      }
    }

    // If no active session found, return the night session
    final nightSessionSnapshot =
        await sessionsCollection.where('session_name', isEqualTo: 'ليلي').get();

    if (nightSessionSnapshot.docs.isNotEmpty) {
      final nightSessionDoc = nightSessionSnapshot.docs.first;
      return CurrentShiftInfoStruct(
          sessionName: 'ليلي', sessionDocRef: nightSessionDoc.reference);
    }

    // No active sessions found and no night session, return null
    debugPrint("NULLLLLLLLLLLLLLLLLLLLLLLLLL");
    return null;
  } catch (e, stackTrace) {
    // Handle errors during Firestore operation
    debugPrint('Error checking current session: $e');
    debugPrint('Stack trace: $stackTrace');
    return null;
  }
}
