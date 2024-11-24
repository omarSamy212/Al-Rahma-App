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

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:open_url/open_url.dart';

Future<void> generateAttendancePDF(
  String sector,
  String shift,
  String date,
  List<dynamic> tableData,
) async {
  final pdf = pw.Document();

  try {
    final fontData = await loadFontData(
        'https://arbfonts.com//wp-content/fonts/naskh-arabic-fonts//NotoNaskhArabicUI-Bold.ttf');

    if (fontData != null) {
      final tajawalFont = pw.Font.ttf(Uint8List.fromList(fontData));

      pdf.addPage(
        pw.MultiPage(
          margin: pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            List<List<String>> rows = [
              [
                'Index',
                'workerCode',
                'name',
                'nationalID',
                'SupplierCode',
                'workerShift',
                'notes',
              ],
            ];

            // Static test data
            List<Map<String, dynamic>> testData = [
              {
                'workerCode': '1001',
                'name': 'علي',
                'nationalID': '123456789',
                'SupplierCode': 'S-001',
                'workerShift': 'صباحي',
                'notes': 'لا يوجد',
              },
              {
                'workerCode': '1002',
                'name': 'محمد',
                'nationalID': '987654321',
                'SupplierCode': 'S-002',
                'workerShift': 'مسائي',
                'notes': 'مراجعة',
              },
              // Add more static data as needed
            ];

            for (int i = 0; i < testData.length; i++) {
              rows.add([
                (i + 1).toString(),
                testData[i]['workerCode'].toString(),
                testData[i]['name'].toString(),
                testData[i]['nationalID'].toString(),
                testData[i]['SupplierCode'].toString(),
                testData[i]['workerShift'].toString(),
                testData[i]['notes'].toString(),
              ]);
            }

            return <pw.Widget>[
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Sector: $sector',
                      style: pw.TextStyle(font: tajawalFont)),
                  pw.Text('Shift: $shift',
                      style: pw.TextStyle(font: tajawalFont)),
                  pw.Text('Date: $date',
                      style: pw.TextStyle(font: tajawalFont)),
                ],
              ),
              pw.Directionality(
                textDirection: pw.TextDirection.rtl, // Set text direction
                child: pw.Table.fromTextArray(
                  context: context,
                  data: rows,
                ),
              ),
            ];
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File('${output.path}/attendance.pdf');

      await file.writeAsBytes(await pdf.save());

      final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('attendance.pdf');
      await firebaseStorageRef.putFile(file);

      final downloadURL = await firebaseStorageRef.getDownloadURL();

      openUrl(downloadURL);
    } else {
      print('Error: Font loading failed');
    }
  } catch (e) {
    print('Error generating PDF: $e');
  }
}

Future<Uint8List> loadFontData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception(
          'Failed to load font from URL. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error loading font: $e');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
