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
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<UserCreationObjectStruct?> addUser(
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
  String socialStatus,
  String nationality,
  String nationalID,
  String natIssuePlace,
  String natIssueDate,
  String natExpireDate,
  NationalInformationStruct? natInfo,
  DrivingInformationStruct? drLicInfo,
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
  DocumentReference? contractorRef,
  String? contractorName,
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
        'nationality': nationality,
        'government': government,
        'city': city,
        'fullAddress': fullAddress,
        'socialStatus': socialStatus,
        'photo_url': photo,
        'employmentDate': employmentDate,
        'front_nat_image_url': frontNatImageUrl,
        'back_nat_image_url': backNatImageUrl,
        'drug_test_image_url': drugTestImageUrl,
        'userCode': userCode,
        'accountStatus': accountStatus,
        'privileges': privileges.toMap(),
        'national_information': natInfo?.toMap(),
        'driving_information': drLicInfo?.toMap(),
        'contractorRef': contractorRef,
        'shift': shift != null
            ? {
                'startShift': shift.startShift,
                'shiftPeriod': shift.shiftPeriod,
              }
            : null,
      };

      if (userRole.toLowerCase() == 'contractor') {
        userData['contractorData'] = {
          'name': contractorName,
          'totalDebit': totalDebit,
          'totalCredit': totalCredit,
          'diflictPercentage': diflictPercentage,
          'shiftPrice': shiftPrice,
          'contractDate': contractDate,
        };

        // Add contractor-specific fields to the contractors collection
        final DocumentReference<Map<String, dynamic>> contractorDocRef =
            FirebaseFirestore.instance.collection('contractors').doc(userID);

        Map<String, dynamic> contractorData = {
          'name': contractorName,
          'totalDebit': totalDebit,
          'totalCredit': totalCredit,
          'diflictPercentage': diflictPercentage,
          'shiftPrice': shiftPrice,
          'contractDate': contractDate,
          'userRef': userDocRef,
        };

        contractorDocRef.set(contractorData);
      }

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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
