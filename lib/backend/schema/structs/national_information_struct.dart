// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NationalInformationStruct extends FFFirebaseStruct {
  NationalInformationStruct({
    String? nationality,
    String? nationalId,
    String? issuePlace,
    String? issueDate,
    String? expiryDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nationality = nationality,
        _nationalId = nationalId,
        _issuePlace = issuePlace,
        _issueDate = issueDate,
        _expiryDate = expiryDate,
        super(firestoreUtilData);

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  set nationality(String? val) => _nationality = val;
  bool hasNationality() => _nationality != null;

  // "national_id" field.
  String? _nationalId;
  String get nationalId => _nationalId ?? '';
  set nationalId(String? val) => _nationalId = val;
  bool hasNationalId() => _nationalId != null;

  // "issue_place" field.
  String? _issuePlace;
  String get issuePlace => _issuePlace ?? '';
  set issuePlace(String? val) => _issuePlace = val;
  bool hasIssuePlace() => _issuePlace != null;

  // "issue_date" field.
  String? _issueDate;
  String get issueDate => _issueDate ?? '';
  set issueDate(String? val) => _issueDate = val;
  bool hasIssueDate() => _issueDate != null;

  // "expiry_date" field.
  String? _expiryDate;
  String get expiryDate => _expiryDate ?? '';
  set expiryDate(String? val) => _expiryDate = val;
  bool hasExpiryDate() => _expiryDate != null;

  static NationalInformationStruct fromMap(Map<String, dynamic> data) =>
      NationalInformationStruct(
        nationality: data['nationality'] as String?,
        nationalId: data['national_id'] as String?,
        issuePlace: data['issue_place'] as String?,
        issueDate: data['issue_date'] as String?,
        expiryDate: data['expiry_date'] as String?,
      );

  static NationalInformationStruct? maybeFromMap(dynamic data) => data is Map
      ? NationalInformationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nationality': _nationality,
        'national_id': _nationalId,
        'issue_place': _issuePlace,
        'issue_date': _issueDate,
        'expiry_date': _expiryDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nationality': serializeParam(
          _nationality,
          ParamType.String,
        ),
        'national_id': serializeParam(
          _nationalId,
          ParamType.String,
        ),
        'issue_place': serializeParam(
          _issuePlace,
          ParamType.String,
        ),
        'issue_date': serializeParam(
          _issueDate,
          ParamType.String,
        ),
        'expiry_date': serializeParam(
          _expiryDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static NationalInformationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NationalInformationStruct(
        nationality: deserializeParam(
          data['nationality'],
          ParamType.String,
          false,
        ),
        nationalId: deserializeParam(
          data['national_id'],
          ParamType.String,
          false,
        ),
        issuePlace: deserializeParam(
          data['issue_place'],
          ParamType.String,
          false,
        ),
        issueDate: deserializeParam(
          data['issue_date'],
          ParamType.String,
          false,
        ),
        expiryDate: deserializeParam(
          data['expiry_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NationalInformationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NationalInformationStruct &&
        nationality == other.nationality &&
        nationalId == other.nationalId &&
        issuePlace == other.issuePlace &&
        issueDate == other.issueDate &&
        expiryDate == other.expiryDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nationality, nationalId, issuePlace, issueDate, expiryDate]);
}

NationalInformationStruct createNationalInformationStruct({
  String? nationality,
  String? nationalId,
  String? issuePlace,
  String? issueDate,
  String? expiryDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NationalInformationStruct(
      nationality: nationality,
      nationalId: nationalId,
      issuePlace: issuePlace,
      issueDate: issueDate,
      expiryDate: expiryDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NationalInformationStruct? updateNationalInformationStruct(
  NationalInformationStruct? nationalInformation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nationalInformation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNationalInformationStructData(
  Map<String, dynamic> firestoreData,
  NationalInformationStruct? nationalInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nationalInformation == null) {
    return;
  }
  if (nationalInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nationalInformation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nationalInformationData =
      getNationalInformationFirestoreData(nationalInformation, forFieldValue);
  final nestedData =
      nationalInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      nationalInformation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNationalInformationFirestoreData(
  NationalInformationStruct? nationalInformation, [
  bool forFieldValue = false,
]) {
  if (nationalInformation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nationalInformation.toMap());

  // Add any Firestore field values
  nationalInformation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNationalInformationListFirestoreData(
  List<NationalInformationStruct>? nationalInformations,
) =>
    nationalInformations
        ?.map((e) => getNationalInformationFirestoreData(e, true))
        .toList() ??
    [];
