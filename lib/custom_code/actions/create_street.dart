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

Future<String> createStreet(
    String streetName,
    String geoLocationString,
    String streetDescription,
    String leaderID,
    int numOfWorkers,
    String sectorID) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Squares collection
    QuerySnapshot snapshot = await firestore.collection('Streets').get();
    int numDocuments = snapshot.docs.length;
    // Generate a unique square ID
    String streetID = 'Street_${numDocuments + 1}';
    DocumentReference leaderRef = firestore.collection('Leaders').doc(leaderID);
    DocumentReference sectorRef = firestore.collection('Sectors').doc(sectorID);

    List<String> geoLocationList = geoLocationString.split(', ');

    // Convert latitude and longitude strings to double
    double latitude = double.parse(geoLocationList[0]);
    double longitude = double.parse(geoLocationList[1]);

    // Create a GeoLocation object
    LatLng streetLatLng = LatLng(latitude, longitude);

    Map<String, dynamic> streetGeoLocationMap = {
      'latitude': streetLatLng.latitude,
      'longitude': streetLatLng.longitude,
    };

    // Create a new document in the Squares collection
    await firestore.collection('Streets').doc(streetID).set({
      'streetName': streetName,
      'streetID': streetID,
      'streetLocation': streetGeoLocationMap,
      'streetDescription': streetDescription,
      'maxNumOfWorkers': numOfWorkers,
      'usersList': [], // Initialize with an empty list
      'leaderRefrence': leaderRef,
    });

    // Get reference to the sector document

    // Update the squaresList field in the sector document
    DocumentSnapshot leaderSnapshot = await leaderRef.get();
    DocumentSnapshot sectorSnapshot = await sectorRef.get();
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic streetsListData = leaderSnapshot.data();
    dynamic sectorSupervisorNeeded = sectorSnapshot.data();

    if (sectorSupervisorNeeded != null &&
        sectorSupervisorNeeded is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      int? currentnumOfNeededWorkers =
          sectorSupervisorNeeded['numOfNeededWorkers'];

      // Ensure that currentSquaresList is not null
      if (currentnumOfNeededWorkers == null) {
        currentnumOfNeededWorkers = 0;
      }

      // Append the new square reference to the current squaresList
      currentnumOfNeededWorkers = currentnumOfNeededWorkers + numOfWorkers;
      // Update the squaresList field in the sector document with the updated array
      await sectorRef.update({'numOfNeededWorkers': currentnumOfNeededWorkers});
    } else {
      print(
          'Error: Unable to retrieve leadersList data from the sector document.');
    }

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (streetsListData != null && streetsListData is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      List<dynamic>? currentStreetsList = streetsListData['streetsList'];

      // Ensure that currentSquaresList is not null
      if (currentStreetsList == null) {
        currentStreetsList = [];
      }
      int? totalNUmOfWorkers = streetsListData['numOfNeededWorkers'];
      if (totalNUmOfWorkers != null) {
        totalNUmOfWorkers = totalNUmOfWorkers + numOfWorkers;
      } else {
        totalNUmOfWorkers = numOfWorkers;
      }
      // Append the new square reference to the current squaresList
      currentStreetsList.add(firestore.doc('Streets/$streetID'));

      // Update the squaresList field in the sector document with the updated array
      await leaderRef.update({
        'streetsList': currentStreetsList,
        'numOfNeededWorkers': totalNUmOfWorkers
      });
    } else {
      print(
          'Error: Unable to retrieve streetsList data from the sector document.');
    }

    return "true";
  } catch (e) {
    return 'street creation failed: $e';
    // return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
