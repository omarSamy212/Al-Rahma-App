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

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> createUserWithoutLogin(
  String email,
  String password,
  String nickName,
  String firstName,
  String middleName,
  String lastName,
  String gender,
  DateTime birthdate,
  String phoneNumber,
  String country,
  String government,
  String city,
  String fullAddress,
  String socialStatus,
  String nationalID,
  String photo,
  DateTime employmentDate,
  String shiftPeriod,
  String userCode,
  String userRole,
  String accountStatus,
) async {
  FirebaseApp app = await Firebase.initializeApp(
      name: 'Secondary', options: Firebase.app().options);
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User user = userCredential.user!;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    DocumentReference documentReference = users.doc(user.uid);

    Map<String, dynamic> data = {
      'email': '${email}',
      'nickName': '${nickName}',
      'firstName': '${firstName}',
      'middleName': '${middleName}',
      'lastName': '${lastName}',
      'gender': '${gender}',
      'birthdate': '${birthdate}',
      'phoneNumber': '${phoneNumber}',
      'country': '${country}',
      'government': '${government}',
      'city': '${city}',
      'fullAddress': '${fullAddress}',
      'socialStatus': '${socialStatus}',
      'nationalID': '${nationalID}',
      'photo': '${photo}',
      'employmentDate': '${employmentDate}',
      'shiftPeriod': '${shiftPeriod}',
      'userCode': '${userCode}',
      'userRole': '${userRole}',
      'accountStatus': '${accountStatus}',
      'created_time': FieldValue.serverTimestamp(),
    };

    await documentReference.set(data);
    await app.delete();
    return true; // User created successfully
  } catch (e) {
    print('Error: $e');
    return false; // User creation failed
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
