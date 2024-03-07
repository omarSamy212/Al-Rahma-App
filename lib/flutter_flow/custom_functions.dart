import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String generateUserID(
  int empNum,
  String role,
) {
  Map<String, int> roleNumberMap = {
    'operation manager': 1000,
    'supervisor': 2000,
    'storage keeper': 3000,
    'worker': 4000,
  };

  int roleNumber = roleNumberMap[role.toLowerCase()] ?? 0;

  int employeeID = roleNumber + empNum;

  return employeeID.toString();
}

String generatePassword() {
  final random = math.Random();
  const String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+';

  String password = '';

  for (int i = 0; i < 8; i++) {
    int randomIndex = random.nextInt(charset.length);
    password += charset[randomIndex];
  }

  return password;
}

String generateEmail(String empID) {
  String domain = "@alrahma.com";
  String email = empID + domain;
  return email;
}

int updateAppstateCart(
  List<ArrayOfToolsStruct>? list,
  ArrayOfToolsStruct? item,
) {
  int existingIndex = list?.indexWhere(
          (ArrayOfToolsStruct) => ArrayOfToolsStruct.toolId == item!.toolId) ??
      -1;

  return existingIndex;
}

DocumentReference? getUserref(String? documentId) {
  // Use the document id to return a user reference
  var docRefFuture = FirebaseFirestore.instance
      .collection("users")
      .where("uid", isEqualTo: documentId!)
      .get()
      .then((querySnapshot) {
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs[0].reference;
    } else {
      // If no document is found, you can handle it by throwing an exception
      throw Exception('No user found with document ID: $documentId');
      // Alternatively, return a default DocumentReference instance
      // return FirebaseFirestore.instance.collection("users").doc('default');
    }
  });

  // Explicitly cast the Future<DocumentReference> to DocumentReference
  return docRefFuture as DocumentReference;
}

DocumentReference? newCustomFunction(
  List<ArrayOfToolsStruct>? requestTools,
  String? toolName,
) {
  try {
    // Check if the 'tools' list is not null
    if (requestTools != null) {
      // Find the tool with the specified 'toolName' in the 'tools' list
      var tool = requestTools.firstWhere(
        (tool) => tool.name == toolName,
      );

      // If the tool is found, return its 'toolId' reference
      if (tool != null && tool.toolId != null) {
        return tool.toolId;
      } else {
        print('Tool with name $toolName not found in the "tools" list.');
        return null;
      }
    } else {
      print('"tools" list is null.');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

String currentDate() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

int? getSelectedQuantity(
  List<ArrayOfToolsStruct>? requestTools,
  String? toolName,
) {
  try {
    // Check if the 'tools' list is not null
    if (requestTools != null) {
      // Find the tool with the specified 'toolName' in the 'tools' list
      var tool = requestTools.firstWhere(
        (tool) => tool.name == toolName,
      );

      // If the tool is found, return its 'toolId' reference
      if (tool != null && tool.toolId != null) {
        return tool.selectedQuantity;
      } else {
        print('Tool with name $toolName not found in the "tools" list.');
        return null;
      }
    } else {
      print('"tools" list is null.');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
