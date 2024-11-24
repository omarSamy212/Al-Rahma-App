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

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> generatePDF(
    String? apiKey,
    String? documentId,
    String? format,
    List<dynamic> samples,
    String sector,
    String shift,
    String date,
    String total) async {
  final requestData = {
    'apiKey': apiKey,
    'document': documentId,
    'format': format ?? 'docx',
    'data': {
      'samples': samples.map((sample) {
        debugPrint(sample['nationalID']);
        debugPrint(sample['workerCode']);
        return {
          'notes': sample['notes'] ?? '',
          'workerShift': sample['workerShift'] ?? '',
          'SupplierCode': sample['SupplierCode'] ?? '',
          'nationalID': sample['nationalID'] ?? '',
          'namenamenamename': sample['name'] ?? '',
          'in': sample['index'] ?? '',
          'work': sample['workerCode'] ?? ''
        };
      }).toList(),
      'sector': sector ?? 'المعادي',
      'shift': shift ?? 'الصباحي',
      'Date': date ?? 'tareee5',
      'total': total ?? '250'
    }
  };

  final headers = {'Content-Type': 'application/json'};
  print(requestData);
  final response = await http.post(
    Uri.parse('https://app.documentero.com/api'),
    headers: headers,
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final documentUrl = jsonResponse['data'];
    return documentUrl;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    print('Error message: ${response.body}');
    throw Exception('Failed to generate document - ${response.body}');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
