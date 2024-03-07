// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissingToolArrayStruct extends FFFirebaseStruct {
  MissingToolArrayStruct({
    DocumentReference? toolRef,
    int? qunantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _toolRef = toolRef,
        _qunantity = qunantity,
        super(firestoreUtilData);

  // "toolRef" field.
  DocumentReference? _toolRef;
  DocumentReference? get toolRef => _toolRef;
  set toolRef(DocumentReference? val) => _toolRef = val;
  bool hasToolRef() => _toolRef != null;

  // "Qunantity" field.
  int? _qunantity;
  int get qunantity => _qunantity ?? 0;
  set qunantity(int? val) => _qunantity = val;
  void incrementQunantity(int amount) => _qunantity = qunantity + amount;
  bool hasQunantity() => _qunantity != null;

  static MissingToolArrayStruct fromMap(Map<String, dynamic> data) =>
      MissingToolArrayStruct(
        toolRef: data['toolRef'] as DocumentReference?,
        qunantity: castToType<int>(data['Qunantity']),
      );

  static MissingToolArrayStruct? maybeFromMap(dynamic data) => data is Map
      ? MissingToolArrayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'toolRef': _toolRef,
        'Qunantity': _qunantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'toolRef': serializeParam(
          _toolRef,
          ParamType.DocumentReference,
        ),
        'Qunantity': serializeParam(
          _qunantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static MissingToolArrayStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MissingToolArrayStruct(
        toolRef: deserializeParam(
          data['toolRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Tools'],
        ),
        qunantity: deserializeParam(
          data['Qunantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MissingToolArrayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MissingToolArrayStruct &&
        toolRef == other.toolRef &&
        qunantity == other.qunantity;
  }

  @override
  int get hashCode => const ListEquality().hash([toolRef, qunantity]);
}

MissingToolArrayStruct createMissingToolArrayStruct({
  DocumentReference? toolRef,
  int? qunantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MissingToolArrayStruct(
      toolRef: toolRef,
      qunantity: qunantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MissingToolArrayStruct? updateMissingToolArrayStruct(
  MissingToolArrayStruct? missingToolArray, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    missingToolArray
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMissingToolArrayStructData(
  Map<String, dynamic> firestoreData,
  MissingToolArrayStruct? missingToolArray,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (missingToolArray == null) {
    return;
  }
  if (missingToolArray.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && missingToolArray.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final missingToolArrayData =
      getMissingToolArrayFirestoreData(missingToolArray, forFieldValue);
  final nestedData =
      missingToolArrayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = missingToolArray.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMissingToolArrayFirestoreData(
  MissingToolArrayStruct? missingToolArray, [
  bool forFieldValue = false,
]) {
  if (missingToolArray == null) {
    return {};
  }
  final firestoreData = mapToFirestore(missingToolArray.toMap());

  // Add any Firestore field values
  missingToolArray.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMissingToolArrayListFirestoreData(
  List<MissingToolArrayStruct>? missingToolArrays,
) =>
    missingToolArrays
        ?.map((e) => getMissingToolArrayFirestoreData(e, true))
        .toList() ??
    [];
