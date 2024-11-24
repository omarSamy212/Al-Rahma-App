// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaderWorkersStructStruct extends FFFirebaseStruct {
  LeaderWorkersStructStruct({
    DocumentReference? workerRef,
    bool? isAssigned,
    DocumentReference? assignedStreet,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _workerRef = workerRef,
        _isAssigned = isAssigned,
        _assignedStreet = assignedStreet,
        super(firestoreUtilData);

  // "workerRef" field.
  DocumentReference? _workerRef;
  DocumentReference? get workerRef => _workerRef;
  set workerRef(DocumentReference? val) => _workerRef = val;
  bool hasWorkerRef() => _workerRef != null;

  // "isAssigned" field.
  bool? _isAssigned;
  bool get isAssigned => _isAssigned ?? false;
  set isAssigned(bool? val) => _isAssigned = val;
  bool hasIsAssigned() => _isAssigned != null;

  // "assignedStreet" field.
  DocumentReference? _assignedStreet;
  DocumentReference? get assignedStreet => _assignedStreet;
  set assignedStreet(DocumentReference? val) => _assignedStreet = val;
  bool hasAssignedStreet() => _assignedStreet != null;

  static LeaderWorkersStructStruct fromMap(Map<String, dynamic> data) =>
      LeaderWorkersStructStruct(
        workerRef: data['workerRef'] as DocumentReference?,
        isAssigned: data['isAssigned'] as bool?,
        assignedStreet: data['assignedStreet'] as DocumentReference?,
      );

  static LeaderWorkersStructStruct? maybeFromMap(dynamic data) => data is Map
      ? LeaderWorkersStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'workerRef': _workerRef,
        'isAssigned': _isAssigned,
        'assignedStreet': _assignedStreet,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'workerRef': serializeParam(
          _workerRef,
          ParamType.DocumentReference,
        ),
        'isAssigned': serializeParam(
          _isAssigned,
          ParamType.bool,
        ),
        'assignedStreet': serializeParam(
          _assignedStreet,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static LeaderWorkersStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LeaderWorkersStructStruct(
        workerRef: deserializeParam(
          data['workerRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        isAssigned: deserializeParam(
          data['isAssigned'],
          ParamType.bool,
          false,
        ),
        assignedStreet: deserializeParam(
          data['assignedStreet'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Streets'],
        ),
      );

  @override
  String toString() => 'LeaderWorkersStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeaderWorkersStructStruct &&
        workerRef == other.workerRef &&
        isAssigned == other.isAssigned &&
        assignedStreet == other.assignedStreet;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([workerRef, isAssigned, assignedStreet]);
}

LeaderWorkersStructStruct createLeaderWorkersStructStruct({
  DocumentReference? workerRef,
  bool? isAssigned,
  DocumentReference? assignedStreet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeaderWorkersStructStruct(
      workerRef: workerRef,
      isAssigned: isAssigned,
      assignedStreet: assignedStreet,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeaderWorkersStructStruct? updateLeaderWorkersStructStruct(
  LeaderWorkersStructStruct? leaderWorkersStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leaderWorkersStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeaderWorkersStructStructData(
  Map<String, dynamic> firestoreData,
  LeaderWorkersStructStruct? leaderWorkersStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leaderWorkersStruct == null) {
    return;
  }
  if (leaderWorkersStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leaderWorkersStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leaderWorkersStructData =
      getLeaderWorkersStructFirestoreData(leaderWorkersStruct, forFieldValue);
  final nestedData =
      leaderWorkersStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      leaderWorkersStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeaderWorkersStructFirestoreData(
  LeaderWorkersStructStruct? leaderWorkersStruct, [
  bool forFieldValue = false,
]) {
  if (leaderWorkersStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leaderWorkersStruct.toMap());

  // Add any Firestore field values
  leaderWorkersStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeaderWorkersStructListFirestoreData(
  List<LeaderWorkersStructStruct>? leaderWorkersStructs,
) =>
    leaderWorkersStructs
        ?.map((e) => getLeaderWorkersStructFirestoreData(e, true))
        .toList() ??
    [];
