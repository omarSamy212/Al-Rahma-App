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

Future<void> createStreet(String streetName, String geoLocationString,
    String streetDescription, String leaderID, int numOfWorkers) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Squares collection
    QuerySnapshot snapshot = await firestore.collection('Streets').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique square ID
    String streetID = 'Street_${numDocuments + 1}';
    DocumentReference leaderRef = firestore.collection('Leaders').doc(leaderID);

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
    // Get the current value of squaresList
    // Get the current value of squaresList
    dynamic streetsListData = leaderSnapshot.data();

    // Ensure that squaresListData is not null and is a Map<String, dynamic>
    if (streetsListData != null && streetsListData is Map<String, dynamic>) {
      // Retrieve squaresList from squaresListData
      List<dynamic>? currentStreetsList = streetsListData['streetsList'];

      // Ensure that currentSquaresList is not null
      if (currentStreetsList == null) {
        currentStreetsList = [];
      }

      // Append the new square reference to the current squaresList
      currentStreetsList.add(firestore.doc('Streets/$streetID'));

      // Update the squaresList field in the sector document with the updated array
      await leaderRef.update({'streetsList': currentStreetsList});
    } else {
      print(
          'Error: Unable to retrieve streetsList data from the sector document.');
    }

    print('street created successfully!');
  } catch (e) {
    print('Error creating street: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
