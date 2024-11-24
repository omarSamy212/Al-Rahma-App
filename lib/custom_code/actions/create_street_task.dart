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

import 'package:flutter/foundation.dart';

Future<bool> createStreetTask(
    DocumentReference createdBy,
    DocumentReference streetRef,
    String taskDescription,
    String? imageUrl1,
    String? imageUrl2,
    String? imageUrl3) async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the number of documents in the Sectors collection
    QuerySnapshot snapshot = await firestore.collection('streetTasks').get();
    int numDocuments = snapshot.docs.length;

    // Generate a unique sector ID
    int final_id = numDocuments + 1;
    String report_id = "Task_" + final_id.toString();
    List<String> imageUrlList = [];
    if (imageUrl1 != null && imageUrl1 != "") {
      imageUrlList.add(imageUrl1);
    }

    if (imageUrl2 != null && imageUrl2 != "") {
      imageUrlList.add(imageUrl2);
    }

    if (imageUrl3 != null && imageUrl3 != "") {
      imageUrlList.add(imageUrl3);
    }

    // Create a new document in the Sectors collection
    await firestore.collection('streetTasks').doc(report_id).set({
      "createdBy": createdBy,
      "streetRefrence": streetRef,
      "images": imageUrlList,
      "createdTime": DateTime.now(),
      "taskDescription": taskDescription,
      "isMarked": false,
      "isReviewed": false,
    });

    print('streetTasks created successfully!');
    return true;
  } catch (e) {
    print('Error creating sector: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
