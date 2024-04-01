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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

Future<UserCreationObjectStruct?> createUser(
  String emailAddress,
  String password,
  String randomDocGen,
  String nickName,
  String firstName,
  String middleName,
  String lastName,
  String gender,
  String birthdate,
  String phoneNumber,
  String country,
  String government,
  String city,
  String fullAddress,
  String socialStatus,
  String nationalID,
  String? photo,
  DateTime employmentDate,
  String userCode,
  String accountStatus,
  String frontNatImageUrl,
  String backNatImageUrl,
  String? drugTestImageUrl,
  String userRole,
  ShiftStruct? shift,
  String userID,
  UserPrivilegesStruct privileges,
) async {
  String returnmsg = 'Success';

  // String userID = await generateUserID(userRole);
  DateTime createdTime = DateTime.now();

  FirebaseApp app = await Firebase.initializeApp(
      name: randomDocGen, options: Firebase.app().options);

  try {
    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(
            email: emailAddress, password: password);
    String? uid = userCredential.user?.uid;

    if (uid != null) {
      final DocumentReference<Map<String, dynamic>> userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userID);

      Map<String, dynamic> userData = {
        'uid': uid,
        'email': emailAddress,
        'created_time': createdTime,
        'display_name': nickName,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'gender': gender,
        'birthdate': birthdate,
        'phone_number': phoneNumber,
        'country': country,
        'government': government,
        'city': city,
        'fullAddress': fullAddress,
        'socialStatus': socialStatus,
        'nationalID': nationalID,
        'photo_url': photo,
        'employmentDate': employmentDate,
        'front_nat_image_url': frontNatImageUrl,
        'back_nat_image_url': backNatImageUrl,
        'drug_test_image_url': drugTestImageUrl,
        'userCode': userCode,
        'accountStatus': accountStatus,
        'privileges': privileges
      };

      if (shift != null) {
        userData['shift'] = {
          'startShift': shift.startingShift,
          'shiftPeriod': shift.shiftPeriod,
        };
      }
      userData['privileges'] = {
        'roleName': privileges.roleName,
        'roleTasks': privileges.roleTasks
      };

      userDocRef.set(userData);

      await app.delete();

      return UserCreationObjectStruct(userRef: userDocRef, message: returnmsg);
    } else {
      returnmsg = "Error while creating the UID";
      return UserCreationObjectStruct(userRef: null, message: returnmsg);
    }
  } on FirebaseAuthException catch (e) {
    return UserCreationObjectStruct(userRef: null, message: e.code);
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
