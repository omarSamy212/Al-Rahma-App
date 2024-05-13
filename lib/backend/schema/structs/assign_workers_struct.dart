// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignWorkersStruct extends FFFirebaseStruct {
  AssignWorkersStruct({
    DocumentReference? userRef,
    String? tool,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _tool = tool,
        super(firestoreUtilData);

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "tool" field.
  String? _tool;
  String get tool => _tool ?? '';
  set tool(String? val) => _tool = val;
  bool hasTool() => _tool != null;

  static AssignWorkersStruct fromMap(Map<String, dynamic> data) =>
      AssignWorkersStruct(
        userRef: data['userRef'] as DocumentReference?,
        tool: data['tool'] as String?,
      );

  static AssignWorkersStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignWorkersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userRef': _userRef,
        'tool': _tool,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'tool': serializeParam(
          _tool,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssignWorkersStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssignWorkersStruct(
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        tool: deserializeParam(
          data['tool'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssignWorkersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignWorkersStruct &&
        userRef == other.userRef &&
        tool == other.tool;
  }

  @override
  int get hashCode => const ListEquality().hash([userRef, tool]);
}

AssignWorkersStruct createAssignWorkersStruct({
  DocumentReference? userRef,
  String? tool,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AssignWorkersStruct(
      userRef: userRef,
      tool: tool,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AssignWorkersStruct? updateAssignWorkersStruct(
  AssignWorkersStruct? assignWorkers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    assignWorkers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAssignWorkersStructData(
  Map<String, dynamic> firestoreData,
  AssignWorkersStruct? assignWorkers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (assignWorkers == null) {
    return;
  }
  if (assignWorkers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && assignWorkers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final assignWorkersData =
      getAssignWorkersFirestoreData(assignWorkers, forFieldValue);
  final nestedData =
      assignWorkersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = assignWorkers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAssignWorkersFirestoreData(
  AssignWorkersStruct? assignWorkers, [
  bool forFieldValue = false,
]) {
  if (assignWorkers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(assignWorkers.toMap());

  // Add any Firestore field values
  assignWorkers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAssignWorkersListFirestoreData(
  List<AssignWorkersStruct>? assignWorkerss,
) =>
    assignWorkerss
        ?.map((e) => getAssignWorkersFirestoreData(e, true))
        .toList() ??
    [];
