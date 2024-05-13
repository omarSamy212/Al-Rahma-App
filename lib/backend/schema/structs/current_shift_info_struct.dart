// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentShiftInfoStruct extends FFFirebaseStruct {
  CurrentShiftInfoStruct({
    String? sessionName,
    DocumentReference? sessionDocRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sessionName = sessionName,
        _sessionDocRef = sessionDocRef,
        super(firestoreUtilData);

  // "session_name" field.
  String? _sessionName;
  String get sessionName => _sessionName ?? '';
  set sessionName(String? val) => _sessionName = val;
  bool hasSessionName() => _sessionName != null;

  // "sessionDocRef" field.
  DocumentReference? _sessionDocRef;
  DocumentReference? get sessionDocRef => _sessionDocRef;
  set sessionDocRef(DocumentReference? val) => _sessionDocRef = val;
  bool hasSessionDocRef() => _sessionDocRef != null;

  static CurrentShiftInfoStruct fromMap(Map<String, dynamic> data) =>
      CurrentShiftInfoStruct(
        sessionName: data['session_name'] as String?,
        sessionDocRef: data['sessionDocRef'] as DocumentReference?,
      );

  static CurrentShiftInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentShiftInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'session_name': _sessionName,
        'sessionDocRef': _sessionDocRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'session_name': serializeParam(
          _sessionName,
          ParamType.String,
        ),
        'sessionDocRef': serializeParam(
          _sessionDocRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CurrentShiftInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CurrentShiftInfoStruct(
        sessionName: deserializeParam(
          data['session_name'],
          ParamType.String,
          false,
        ),
        sessionDocRef: deserializeParam(
          data['sessionDocRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['sessions'],
        ),
      );

  @override
  String toString() => 'CurrentShiftInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentShiftInfoStruct &&
        sessionName == other.sessionName &&
        sessionDocRef == other.sessionDocRef;
  }

  @override
  int get hashCode => const ListEquality().hash([sessionName, sessionDocRef]);
}

CurrentShiftInfoStruct createCurrentShiftInfoStruct({
  String? sessionName,
  DocumentReference? sessionDocRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentShiftInfoStruct(
      sessionName: sessionName,
      sessionDocRef: sessionDocRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentShiftInfoStruct? updateCurrentShiftInfoStruct(
  CurrentShiftInfoStruct? currentShiftInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentShiftInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentShiftInfoStructData(
  Map<String, dynamic> firestoreData,
  CurrentShiftInfoStruct? currentShiftInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentShiftInfo == null) {
    return;
  }
  if (currentShiftInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentShiftInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentShiftInfoData =
      getCurrentShiftInfoFirestoreData(currentShiftInfo, forFieldValue);
  final nestedData =
      currentShiftInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currentShiftInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentShiftInfoFirestoreData(
  CurrentShiftInfoStruct? currentShiftInfo, [
  bool forFieldValue = false,
]) {
  if (currentShiftInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentShiftInfo.toMap());

  // Add any Firestore field values
  currentShiftInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentShiftInfoListFirestoreData(
  List<CurrentShiftInfoStruct>? currentShiftInfos,
) =>
    currentShiftInfos
        ?.map((e) => getCurrentShiftInfoFirestoreData(e, true))
        .toList() ??
    [];
