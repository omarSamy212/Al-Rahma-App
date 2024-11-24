// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GeneratePDFStruct extends FFFirebaseStruct {
  GeneratePDFStruct({
    String? name,
    String? supplierCode,
    String? workerShift,
    String? notes,
    String? sector,
    String? nationalID,
    String? workerCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _supplierCode = supplierCode,
        _workerShift = workerShift,
        _notes = notes,
        _sector = sector,
        _nationalID = nationalID,
        _workerCode = workerCode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "SupplierCode" field.
  String? _supplierCode;
  String get supplierCode => _supplierCode ?? '';
  set supplierCode(String? val) => _supplierCode = val;
  bool hasSupplierCode() => _supplierCode != null;

  // "workerShift" field.
  String? _workerShift;
  String get workerShift => _workerShift ?? '';
  set workerShift(String? val) => _workerShift = val;
  bool hasWorkerShift() => _workerShift != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  // "sector" field.
  String? _sector;
  String get sector => _sector ?? '';
  set sector(String? val) => _sector = val;
  bool hasSector() => _sector != null;

  // "nationalID" field.
  String? _nationalID;
  String get nationalID => _nationalID ?? '';
  set nationalID(String? val) => _nationalID = val;
  bool hasNationalID() => _nationalID != null;

  // "workerCode" field.
  String? _workerCode;
  String get workerCode => _workerCode ?? '';
  set workerCode(String? val) => _workerCode = val;
  bool hasWorkerCode() => _workerCode != null;

  static GeneratePDFStruct fromMap(Map<String, dynamic> data) =>
      GeneratePDFStruct(
        name: data['name'] as String?,
        supplierCode: data['SupplierCode'] as String?,
        workerShift: data['workerShift'] as String?,
        notes: data['notes'] as String?,
        sector: data['sector'] as String?,
        nationalID: data['nationalID'] as String?,
        workerCode: data['workerCode'] as String?,
      );

  static GeneratePDFStruct? maybeFromMap(dynamic data) => data is Map
      ? GeneratePDFStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'SupplierCode': _supplierCode,
        'workerShift': _workerShift,
        'notes': _notes,
        'sector': _sector,
        'nationalID': _nationalID,
        'workerCode': _workerCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'SupplierCode': serializeParam(
          _supplierCode,
          ParamType.String,
        ),
        'workerShift': serializeParam(
          _workerShift,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'sector': serializeParam(
          _sector,
          ParamType.String,
        ),
        'nationalID': serializeParam(
          _nationalID,
          ParamType.String,
        ),
        'workerCode': serializeParam(
          _workerCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static GeneratePDFStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeneratePDFStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        supplierCode: deserializeParam(
          data['SupplierCode'],
          ParamType.String,
          false,
        ),
        workerShift: deserializeParam(
          data['workerShift'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        sector: deserializeParam(
          data['sector'],
          ParamType.String,
          false,
        ),
        nationalID: deserializeParam(
          data['nationalID'],
          ParamType.String,
          false,
        ),
        workerCode: deserializeParam(
          data['workerCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GeneratePDFStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeneratePDFStruct &&
        name == other.name &&
        supplierCode == other.supplierCode &&
        workerShift == other.workerShift &&
        notes == other.notes &&
        sector == other.sector &&
        nationalID == other.nationalID &&
        workerCode == other.workerCode;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, supplierCode, workerShift, notes, sector, nationalID, workerCode]);
}

GeneratePDFStruct createGeneratePDFStruct({
  String? name,
  String? supplierCode,
  String? workerShift,
  String? notes,
  String? sector,
  String? nationalID,
  String? workerCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeneratePDFStruct(
      name: name,
      supplierCode: supplierCode,
      workerShift: workerShift,
      notes: notes,
      sector: sector,
      nationalID: nationalID,
      workerCode: workerCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeneratePDFStruct? updateGeneratePDFStruct(
  GeneratePDFStruct? generatePDF, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    generatePDF
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeneratePDFStructData(
  Map<String, dynamic> firestoreData,
  GeneratePDFStruct? generatePDF,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (generatePDF == null) {
    return;
  }
  if (generatePDF.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && generatePDF.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final generatePDFData =
      getGeneratePDFFirestoreData(generatePDF, forFieldValue);
  final nestedData =
      generatePDFData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = generatePDF.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeneratePDFFirestoreData(
  GeneratePDFStruct? generatePDF, [
  bool forFieldValue = false,
]) {
  if (generatePDF == null) {
    return {};
  }
  final firestoreData = mapToFirestore(generatePDF.toMap());

  // Add any Firestore field values
  generatePDF.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeneratePDFListFirestoreData(
  List<GeneratePDFStruct>? generatePDFs,
) =>
    generatePDFs?.map((e) => getGeneratePDFFirestoreData(e, true)).toList() ??
    [];
