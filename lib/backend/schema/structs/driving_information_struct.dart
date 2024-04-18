// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrivingInformationStruct extends FFFirebaseStruct {
  DrivingInformationStruct({
    String? licsenceType,
    String? expiryDate,
    String? issueDate,
    String? issuePlace,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _licsenceType = licsenceType,
        _expiryDate = expiryDate,
        _issueDate = issueDate,
        _issuePlace = issuePlace,
        super(firestoreUtilData);

  // "licsence_type" field.
  String? _licsenceType;
  String get licsenceType => _licsenceType ?? '';
  set licsenceType(String? val) => _licsenceType = val;
  bool hasLicsenceType() => _licsenceType != null;

  // "expiry_date" field.
  String? _expiryDate;
  String get expiryDate => _expiryDate ?? '';
  set expiryDate(String? val) => _expiryDate = val;
  bool hasExpiryDate() => _expiryDate != null;

  // "issue_date" field.
  String? _issueDate;
  String get issueDate => _issueDate ?? '';
  set issueDate(String? val) => _issueDate = val;
  bool hasIssueDate() => _issueDate != null;

  // "issue_place" field.
  String? _issuePlace;
  String get issuePlace => _issuePlace ?? '';
  set issuePlace(String? val) => _issuePlace = val;
  bool hasIssuePlace() => _issuePlace != null;

  static DrivingInformationStruct fromMap(Map<String, dynamic> data) =>
      DrivingInformationStruct(
        licsenceType: data['licsence_type'] as String?,
        expiryDate: data['expiry_date'] as String?,
        issueDate: data['issue_date'] as String?,
        issuePlace: data['issue_place'] as String?,
      );

  static DrivingInformationStruct? maybeFromMap(dynamic data) => data is Map
      ? DrivingInformationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'licsence_type': _licsenceType,
        'expiry_date': _expiryDate,
        'issue_date': _issueDate,
        'issue_place': _issuePlace,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'licsence_type': serializeParam(
          _licsenceType,
          ParamType.String,
        ),
        'expiry_date': serializeParam(
          _expiryDate,
          ParamType.String,
        ),
        'issue_date': serializeParam(
          _issueDate,
          ParamType.String,
        ),
        'issue_place': serializeParam(
          _issuePlace,
          ParamType.String,
        ),
      }.withoutNulls;

  static DrivingInformationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DrivingInformationStruct(
        licsenceType: deserializeParam(
          data['licsence_type'],
          ParamType.String,
          false,
        ),
        expiryDate: deserializeParam(
          data['expiry_date'],
          ParamType.String,
          false,
        ),
        issueDate: deserializeParam(
          data['issue_date'],
          ParamType.String,
          false,
        ),
        issuePlace: deserializeParam(
          data['issue_place'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DrivingInformationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DrivingInformationStruct &&
        licsenceType == other.licsenceType &&
        expiryDate == other.expiryDate &&
        issueDate == other.issueDate &&
        issuePlace == other.issuePlace;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([licsenceType, expiryDate, issueDate, issuePlace]);
}

DrivingInformationStruct createDrivingInformationStruct({
  String? licsenceType,
  String? expiryDate,
  String? issueDate,
  String? issuePlace,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DrivingInformationStruct(
      licsenceType: licsenceType,
      expiryDate: expiryDate,
      issueDate: issueDate,
      issuePlace: issuePlace,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DrivingInformationStruct? updateDrivingInformationStruct(
  DrivingInformationStruct? drivingInformation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    drivingInformation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDrivingInformationStructData(
  Map<String, dynamic> firestoreData,
  DrivingInformationStruct? drivingInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (drivingInformation == null) {
    return;
  }
  if (drivingInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && drivingInformation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final drivingInformationData =
      getDrivingInformationFirestoreData(drivingInformation, forFieldValue);
  final nestedData =
      drivingInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      drivingInformation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDrivingInformationFirestoreData(
  DrivingInformationStruct? drivingInformation, [
  bool forFieldValue = false,
]) {
  if (drivingInformation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(drivingInformation.toMap());

  // Add any Firestore field values
  drivingInformation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDrivingInformationListFirestoreData(
  List<DrivingInformationStruct>? drivingInformations,
) =>
    drivingInformations
        ?.map((e) => getDrivingInformationFirestoreData(e, true))
        .toList() ??
    [];
