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

Future<UserCreationObjectStruct?> createContractor(
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
  String government,
  String city,
  String fullAddress,
  NationalInformationStruct? natInfo,
  String? photo,
  String userCode,
  String accountStatus,
  String frontNatImageUrl,
  String backNatImageUrl,
  String userRole,
  String userID,
  UserPrivilegesStruct privileges,
  DocumentReference? contractorRef,
  String? name,
  double? totalDebit,
  double? totalCredit,
  double? diflictPercentage,
  double? shiftPrice,
  String? contractDate,
) async {
  String returnmsg = 'Success';
  DateTime createdTime = DateTime.now();

  FirebaseApp app = await Firebase.initializeApp(
    name: randomDocGen,
    options: Firebase.app().options,
  );

  try {
    // Check if the email is already in use
    final existingUser = await FirebaseAuth.instanceFor(app: app)
        .fetchSignInMethodsForEmail(emailAddress);
    if (existingUser.isNotEmpty) {
      print('Email is already in use: $emailAddress');
      return UserCreationObjectStruct(
          userRef: null, message: 'Email is already in use');
    }

    // Create user in Firebase Authentication
    UserCredential userCredential =
        await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
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
        'government': government,
        'city': city,
        'fullAddress': fullAddress,
        'photo_url': photo,
        'front_nat_image_url': frontNatImageUrl,
        'back_nat_image_url': backNatImageUrl,
        'userCode': userCode,
        'accountStatus': accountStatus,
        'privileges': privileges,
        'national_information': natInfo,
        'contractorRef': contractorRef,
      };

      if (natInfo != null) {
        userData['national_information'] = {
          if (natInfo.hasNationality()) 'nationality': natInfo.nationality,
          if (natInfo.hasNationalId()) 'national_id': natInfo.nationalId,
          if (natInfo.hasIssuePlace()) 'issue_place': natInfo.issuePlace,
          if (natInfo.hasIssueDate()) 'issue_date': natInfo.issueDate,
          if (natInfo.hasExpiryDate()) 'expiry_date': natInfo.expiryDate,
        };
      }

      userDocRef.set(userData);

      // Create contractor data
      final DocumentReference<Map<String, dynamic>> contractorDocRef =
          FirebaseFirestore.instance.collection('contractors').doc();

      Map<String, dynamic> contractorData = {
        'name': name,
        'totalDebit': totalDebit,
        'totalCredit': totalCredit,
        'userRef': userDocRef,
        'diflictPercentage': diflictPercentage,
        'shiftPrice': shiftPrice,
        'contractDate': contractDate,
        'code': userCode,
      };

      contractorDocRef.set(contractorData);

      await app.delete();

      return UserCreationObjectStruct(userRef: userDocRef, message: returnmsg);
    } else {
      returnmsg = "Error while creating the UID";
      return UserCreationObjectStruct(userRef: null, message: returnmsg);
    }
  } on FirebaseAuthException catch (e) {
    print(
        'FirebaseAuthException: ${e.message}'); // Add this line to log the error message
    return UserCreationObjectStruct(userRef: null, message: e.code);
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
