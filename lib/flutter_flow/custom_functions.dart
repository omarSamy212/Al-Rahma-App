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
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String generateUserID(String role) {
  debugPrint("Role name of ID: " + role);
  String roleNumber =
      (role.toLowerCase() == 'worker' || role == 'عامل') ? '7000' : '1000';
  return roleNumber;
}

String generatePassword() {
  final random = math.Random();
  const String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_,.';

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
  try {
    return FirebaseFirestore.instance.collection('users').doc(documentId);
  } catch (e) {
    print('Error getting user reference: $e');
    return null;
  }
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
  var formatter = DateFormat('dd-MM-yyyy');
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

NatInfoStruct extractInfoFromNat(String nationalID) {
  if (nationalID.length != 14) {
    return NatInfoStruct(
        age: 0,
        birthdate: DateTime.now().toString()); // Invalid National ID length
  }

  String birthYearString = nationalID.substring(1, 3);
  int birthYear = int.tryParse(birthYearString) ?? 0;

  // Adjust birth year based on the century
  int birthCentury = int.parse(nationalID.substring(0, 1));
  if (birthCentury == 3) {
    birthYear += 2000;
  } else if (birthCentury == 2) {
    birthYear += 1900;
  }

  String birthMonthString = nationalID.substring(3, 5);
  int birthMonth = int.tryParse(birthMonthString) ?? 0;

  String birthDayString = nationalID.substring(5, 7);
  int birthDay = int.tryParse(birthDayString) ?? 0;

  // Calculate birthdate
  DateTime birthDate = DateTime(birthYear, birthMonth, birthDay);

  // Calculate age
  DateTime today = DateTime.now();
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  String formattedBirthdate =
      DateFormat('yyyy-MM-dd').format(birthDate); // Format birthdate

  return NatInfoStruct(age: age, birthdate: formattedBirthdate);
}

int calculateAge(DateTime birthdate) {
  final now = DateTime.now();
  int age = now.year - birthdate.year;
  if (now.month < birthdate.month ||
      (now.month == birthdate.month && now.day < birthdate.day)) {
    age--;
  }
  return age;
}

String? kaloonInSefoon() {
  return "الكالون في السيفون";
}

bool? checkNameRegex(
  String? name,
  String? sentence,
) {
  if (name == null || sentence == null) {
    // Handle null inputs
    return false;
  }

  // Escape special characters in the name to ensure proper regex matching
  final escapedName = RegExp.escape(name);

  // Construct a regular expression pattern to match any substring containing the name
  final RegExp regex = RegExp('.*$escapedName.*', caseSensitive: false);

  // Check if the name appears anywhere in the sentence
  return regex.hasMatch(sentence);
}

String? mapWorkerName(String? name) {
  if (name == null) {
    return "";
  }

  debugPrint("Data printed: ");
  debugPrint(name);

  // Define the constant mapping of names
  final Map<String, String> nameMappings = {
    "Worker": "عامل",
    "Superviser": "مشرف",
    // Add more mappings as needed
  };

  // Check if the name exists in the mapping, return the Arabic equivalent if found
  if (nameMappings.containsKey(name)) {
    debugPrint(nameMappings[name]);
    return nameMappings[name];
  } else {
    // Return null if the name is not found in the mapping
    return "";
  }
}

DateTime stringDateToDate(String dateString) {
  DateFormat format =
      DateFormat("yyyy-MM-dd"); // Adjust the format as per your date string

  // Use the parse method of DateFormat to convert the string to DateTime
  return format.parse(dateString);
}

LatLng convertGeoLocationToLatLon(GeoLocationStruct position) {
  return LatLng(position.latitude, position.longitude);
}

String checkShift() {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour >= 6 && hour < 14) {
    return 'صباحي';
  } else if (hour >= 14 && hour < 22) {
    return 'مسائي';
  } else {
    return 'ليلي';
  }
}

int getOldImageIndex(
  String imageID,
  List<ImageOldPathsStruct> list,
) {
  // i want to search in list and return the index of the element where imageID equal to imageId
  for (int i = 0; i < list.length; i++) {
    if (list[i].imageID == imageID) {
      debugPrint('Value found in: $i');
      return i;
    }
  }
  debugPrint("Value not found");
  return -1;
}

DocumentReference? getAttendanceLogRef(String docId) {
  return FirebaseFirestore.instance.collection('attendance_log').doc(docId);
}

String formatCoordinates(String inputString) {
  debugPrint("input string: " + inputString);
  final regex = RegExp(r"lat: (\d+\.\d+), lng: (\d+\.\d+)");
  final match = regex.firstMatch(inputString);
  debugPrint("match: " + match.toString());
  if (match == null) {
    return inputString; // Handle invalid input
  }

  final latStr = match.group(1)!;
  final lngStr = match.group(2)!;

  // Convert to doubles
  final originalLat = double.parse(latStr);
  final originalLng = double.parse(lngStr);
  debugPrint("original lat: " + originalLat.toString());
  debugPrint("original lon: " + originalLng.toString());

  // Increase precision (adjust as needed)
  // final precision = 6;
  // final preciseLat = originalLat * math.pow(10, precision);
  // final preciseLng = originalLng * math.pow(10, precision);

  // Format and return the output string
  return "${originalLat}, ${originalLng}";
}

int getRoleStageIndex(
  String role,
  List<String> stagesList,
) {
  debugPrint("List values is: " + stagesList.toString());
  debugPrint("List length: " + stagesList.length.toString());
  for (int i = 0; i < stagesList.length; i++) {
    if (stagesList[i] == role) {
      debugPrint('Value found in: $i');
      return i;
    }
  }
  debugPrint("Value not found");
  return -1;
}

String getTimeNow() {
  final now = DateTime.now();
  final formatter = DateFormat('HH:mm');
  final formattedTime = formatter.format(now);

  return formattedTime;
}

bool checkStringInList(
  List<String>? stringList,
  String? string,
) {
  if (stringList != null && string != null) {
    return stringList.contains(string);
  } else {
    debugPrint("Null value received in checkStringInList");
    return false;
  }
}

dynamic sampelsToJson(List<GeneratePDFStruct> samples) {
  List<Map<String, dynamic>> jsonDataList = [];

  for (var sample in samples) {
    jsonDataList.add({
      'notes': sample.notes ?? '',
      'workerShift': sample.workerShift ?? '',
      'SupplierCode': sample.supplierCode ?? '',
      'nationalID': sample.nationalID ?? '',
      'name': sample.name ?? '',
      'workerCode': sample.workerCode ?? '',
      'in': samples.indexOf(sample),
    });
  }
  //debugPrint(jsonDataList);
  return jsonDataList;
}

DocumentReference? getSectorRef(String? docID) {
  return FirebaseFirestore.instance.collection('Sectors').doc(docID);
}

DocumentReference? getSessionRef(String? docId) {
  return FirebaseFirestore.instance.collection('sessions').doc(docId);
}

bool checkRoleInMap(
  List<PersonalRequestUserResponsStruct> roleMap,
  String role,
) {
  try {
    // Iterate over each element in the roleMap list
    for (var item in roleMap) {
      // Check if the roleName matches the specified role
      if (item.userRole == role) {
        return true;
      }
    }
    // If no match found, return false
    return false;
  } catch (e) {
    // Handle any errors
    print('Error: $e');
    return false;
  }
}

String checkRoleResponse(
  List<PersonalRequestUserResponsStruct>? roleMap,
  String? role,
) {
  try {
    // Check if roleMap is null or empty
    if (roleMap == null || roleMap.isEmpty) {
      return ""; // Return empty string if roleMap is null or empty
    }

    // Iterate over each element in the roleMap list
    for (var item in roleMap) {
      // Check if the roleName matches the specified role
      if (item.userRole == role) {
        return item.response; // Return the response if roleName matches
      }
    }

    // If no match found, return empty string
    return "";
  } catch (e) {
    // Handle any errors
    print('Error: $e');
    return ""; // Return empty string in case of error
  }
}

String getRoleRejection(List<PersonalRequestUserResponsStruct>? roleMap) {
  try {
    // Check if roleMap is null or empty
    if (roleMap == null || roleMap.isEmpty) {
      return ""; // Return empty string if roleMap is null or empty
    }

    // Iterate over each element in the roleMap list
    for (var item in roleMap) {
      // Check if the response of the element is "Rejected"
      if (item.response == "Rejected") {
        if (item.userRole != null) {
          return item.userRole; // Return the roleName if response is "Rejected"
        } else {
          return "";
        }
      }
    }

    // If no role with response "Rejected" found, return empty string
    return "";
  } catch (e) {
    // Handle any errors
    print('Error: $e');
    return ""; // Return empty string in case of error
  }
}

List<LatLng> convertGeoListToLatLon(List<StreetsRecord> streetList) {
  List<LatLng> latLngList = [];

  for (var streetRecord in streetList) {
    latLngList.add(LatLng(streetRecord.streetLocation.latitude,
        streetRecord.streetLocation.longitude));
  }

  return latLngList;
}

bool compareLatLng(
  LatLng latLng1,
  LatLng latLng2,
) {
  return latLng1.latitude == latLng2.latitude &&
      latLng1.longitude == latLng2.longitude;
}

bool isDatePastOrToday(String? dateString) {
  DateTime currentDate = DateTime.now();
  DateTime targetDate = DateFormat("dd-MM-yyyy").parse(dateString!);

  return currentDate.isAfter(targetDate) ||
      currentDate.isAtSameMomentAs(targetDate);
}

bool hasCheckRef(DocumentReference userRef) {
  bool hasField = false;

  userRef.get().then((DocumentSnapshot userDoc) {
    if (userDoc.exists && userDoc.data() is Map<String, dynamic>) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      if (userData.containsKey("attendance")) {
        Map<String, dynamic>? attendance = userData["attendance"];
        hasField = attendance?.containsKey("check_ref") ?? false;
      }
    }
  }).catchError((error) {
    print("Error: $error");
  });

  return hasField;
}

DateTime? stringToDate(String strinDate) {
  final format = DateFormat('dd-MM-yyyy');
  try {
    return format.parse(strinDate);
  } catch (e) {
    // Handle invalid date format (optional)
    print("Invalid date format: $e");
    return null; // Or return a default date
  }
}
