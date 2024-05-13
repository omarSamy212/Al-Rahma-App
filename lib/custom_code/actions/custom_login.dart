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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<UserLoginObjectStruct?> customLogin(
    String email, String password) async {
  debugPrint('Email: $email');
  debugPrint('Password: $password');

  final FirebaseAuth authService = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Sign in the user
    final userCredential = await authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String? authEmail = userCredential.user?.email;
    if (authEmail != null) {
      String documentPath = "users/User_" + email.substring(0, 4);
      debugPrint("Returned user Ref: " + documentPath);

      // Create the UserLoginObjectStruct with message and loggedInUserRef
      UserLoginObjectStruct userLoginObject = UserLoginObjectStruct(
        message: "success",
        userRef: firestore.doc(documentPath),
      );
      return userLoginObject;
    } else {
      // If user email is null
      return UserLoginObjectStruct(
        message: "User email is null",
        userRef: null,
      );
    }
  } catch (e) {
    print("Error signing in: $e");
    // Return error message
    return UserLoginObjectStruct(
      message: "Error signing in: $e",
      userRef: null,
    );
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
