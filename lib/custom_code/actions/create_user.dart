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
import 'package:cloud_firestore/cloud_firestore.dart';

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
  String educationData,
  String isEmployed,
  String relegion,
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
  String? employmentDate,
  String userCode,
  String accountStatus,
  String? frontNatImageUrl,
  String? backNatImageUrl,
  String? drugTestImageUrl,
  ShiftStruct? shift,
  String userID,
  DocumentReference? contractorRef,
  double? totalDebit,
  double? totalCredit,
  double? diflictPercentage,
  double? shiftPrice,
  String? contractDate,
  String userRole,
  bool? isDriver,
  String roleID,
  String roleName,
  String createdBy,
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
        'isEmployed': isEmployed,
        'educationData': educationData,
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
        'userCode': userCode,
        'accountStatus': accountStatus,
        'national_information': natInfo?.toMap(),
        'created_by': createdBy,
        'is_driver': isDriver,
      };

      // Add contractor reference if the user's role is "contractor"
      if (userRole.toLowerCase() == 'contractor' || userRole == 'مورد') {
        // Create contractor document with the same ID as the user document
        final DocumentReference<Map<String, dynamic>> contractorDocRef =
            FirebaseFirestore.instance.collection('contractors').doc(userID);

        Map<String, dynamic> contractorData = {
          'name': nickName,
          'code': userCode,
          'totalDebit': totalDebit,
          'totalCredit': totalCredit,
          'diflictPercentage': diflictPercentage,
          'shiftPrice': shiftPrice,
          'contractDate': contractDate,
          'userRef': userDocRef, // Reference to user document
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
        userData['contractorRef'] = contractorRef;
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
      debugPrint("User Data: " + userData.toString());
      // Set user data
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

Future<List<DocumentReference>?> grantUserRole(String roleID) async {
  try {
    // Fetch tasks for the specified role ID
    String roleMap = "Role_" + roleID + "_Map";
    debugPrint('Role map ID: $roleMap');
    final tasksSnapshot = await FirebaseFirestore.instance
        .collection("Role_Mapping")
        .doc(roleMap)
        .get();

    // Check if data exists in the snapshot
    if (tasksSnapshot.exists) {
      // Extract tasks list from snapshot data
      final tasksList = tasksSnapshot.data()?['Tasks'] as List<dynamic>;

      // Check if tasksList is not null and is a List
      if (tasksList != null && tasksList is List) {
        // Convert each task ID to a DocumentReference
        final List<DocumentReference<Object?>> references = tasksList
            .where((taskDocRef) =>
                taskDocRef is DocumentReference || taskDocRef is String)
            .map<DocumentReference<Object?>>((taskDocRef) {
          if (taskDocRef is DocumentReference) {
            return taskDocRef
                as DocumentReference<Object?>; // Cast to non-nullable type
          } else if (taskDocRef is String) {
            return FirebaseFirestore.instance
                    .collection("tasks")
                    .doc(taskDocRef)
                as DocumentReference<Object?>; // Cast to non-nullable type
          } else {
            // This branch should never be reached if the filter is correct, but you can handle it if needed
            throw ArgumentError('Invalid task document reference: $taskDocRef');
          }
        }).toList();

        // Remove null values (if any) from the list
        references.removeWhere((ref) => ref == null);

        debugPrint('Tasks List: $tasksList');
        debugPrint('Document References: $references');
        return references;
      } else {
        debugPrint('Error: tasksList is null or not a List');
        return null;
      }
    } else {
      debugPrint('Error: Snapshot does not exist');
      return null;
    }
  } catch (error, stackTrace) {
    debugPrint('Error updating privileges: $error');
    debugPrint('Stack Trace: $stackTrace');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
