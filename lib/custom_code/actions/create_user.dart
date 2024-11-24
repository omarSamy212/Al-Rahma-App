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

import 'package:al_rahma/custom_code/actions/create_privilige.dart';
import 'package:al_rahma/custom_code/actions/create_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCreationObjectStruct?> createUser(
  String userID,
  String emailAddress,
  String password,
  String nickName,
  String firstName,
  String middleName,
  String lastName,
  String gender,
  String birthdate,
  String educationData,
  String randomDocGen,
  String isEmployed,
  String relegion,
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
  String? employmentDate,
  String userCode,
  String accountStatus,
  String? frontNatImageUrl,
  String? backNatImageUrl,
  String? drugTestImageUrl,
  ShiftStruct? shift,
  DocumentReference? contractorRef,
  double? totalDebit,
  double? totalCredit,
  double? diflictPercentage,
  double? shiftPrice,
  DateTime? contractDate,
  String userRole,
  String? jobCode,
  bool? isDriver,
  String roleID,
  String roleName,
  String createdBy,
  String phoneNumber,
) async {
  String returnmsg = 'Success';
  DateTime createdTime = DateTime.now();

  FirebaseApp app = await Firebase.initializeApp(
    name: randomDocGen,
    options: Firebase.app().options,
  );
  try {
    FirebaseAuth creationAuth = FirebaseAuth.instanceFor(app: app);
    // Call Cloud Function to create user with custom UID
    UserCredential userCredential =
        await creationAuth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password, // Pass the password parameter
    );
    String? uid = userCredential.user?.uid;

    final DocumentReference<Map<String, dynamic>> authUserDocRef =
        FirebaseFirestore.instance.collection('AuthUser').doc(uid);

    authUserDocRef.set({
      'email': emailAddress,
      'userRefrence':
          FirebaseFirestore.instance.collection('users').doc(userID),
    });

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
      'isEmployed': isEmployed,
      'educationData': educationData,
      'gender': gender,
      'birthdate': birthdate,
      'government': government,
      'city': city,
      'fullAddress': fullAddress,
      'socialStatus': socialStatus,
      'photo_url': photo,
      'employmentDate': employmentDate,
      'front_nat_image_url': frontNatImageUrl,
      'back_nat_image_url': backNatImageUrl,
      'userCode': userCode,
      'accountStatus': accountStatus,
      'national_information': natInfo?.toMap(),
      'created_by': createdBy,
      'is_driver': isDriver,
      'phone_number': phoneNumber,
    };

    // Add contractor reference if the user's role is "contractor"
    if (userRole.toLowerCase() == 'contractor' || userRole == 'مورد') {
      // Create contractor document with the same ID as the user document
      final DocumentReference<Map<String, dynamic>> contractorDocRef =
          FirebaseFirestore.instance.collection('contractors').doc(userID);

      Map<String, dynamic> contractorData = {
        'name': nickName,
        'code': userCode,
        'total_debit': totalDebit,
        'total_credit': totalCredit,
        'diflict_percentage': diflictPercentage,
        'shift_price': shiftPrice,
        'contract_date': contractDate,
        'user_ref': userDocRef, // Reference to user document
      };

      contractorDocRef.set(contractorData);

      // Set contractor reference as a document reference to the contractor document
      userData['contractorRef'] = contractorDocRef;
    } else {
      // Add shift and drug_test_image_url fields for non-contractor roles
      userData['shift'] = shift != null
          ? {
              'startShift': shift.startShift,
              'shiftPeriod': shift.shiftPeriod,
            }
          : null;
      userData['drug_test_image_url'] = drugTestImageUrl;
      if (contractorRef != null) {
        userData['contractorRef'] = contractorRef;
      }
    }
    if (userRole.toLowerCase() == 'Supervisor' || userRole == 'مشرف') {
      userData['leaderAreaRefrence1'] = null;
      userData['leaderAreaRefrence2'] = null;
    }
    if (userRole.toLowerCase() == 'Worker' || userRole == 'عامل') {
      userData['job_code'] = jobCode;
    }

    // Add driving information if the user's role is "driver"
    if (isDriver! && drLicInfo != null) {
      userData['driving_information'] = drLicInfo.toMap();
    }

    // Populate privileges field with granted privilege references
    List<DocumentReference>? privileges = await grantUserRole(roleID);
    if (privileges != null) {
      userData['privileges'] = {
        'granted_privilege': privileges,
        'role_name': roleName,
      };
    }

    // Set user data
    userDocRef.set(userData);
    debugPrint('User created successfuly');
    await app.delete();
    return UserCreationObjectStruct(userRef: userDocRef, message: 'Success');
  } catch (e, stackTrace) {
    print('Error creating new user: $e');
    print('Stack Trace: $stackTrace');
    return UserCreationObjectStruct(
        userRef: null, message: 'Error creating new user');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
