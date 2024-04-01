// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ShiftStruct extends FFFirebaseStruct {
  ShiftStruct({
    String? startingShift,
    String? shiftPeriod,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startingShift = startingShift,
        _shiftPeriod = shiftPeriod,
        super(firestoreUtilData);

  // "startingShift" field.
  String? _startingShift;
  String get startingShift => _startingShift ?? '';
  set startingShift(String? val) => _startingShift = val;
  bool hasStartingShift() => _startingShift != null;

  // "shiftPeriod" field.
  String? _shiftPeriod;
  String get shiftPeriod => _shiftPeriod ?? '';
  set shiftPeriod(String? val) => _shiftPeriod = val;
  bool hasShiftPeriod() => _shiftPeriod != null;

  static ShiftStruct fromMap(Map<String, dynamic> data) => ShiftStruct(
        startingShift: data['startingShift'] as String?,
        shiftPeriod: data['shiftPeriod'] as String?,
      );

  static ShiftStruct? maybeFromMap(dynamic data) =>
      data is Map ? ShiftStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'startingShift': _startingShift,
        'shiftPeriod': _shiftPeriod,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startingShift': serializeParam(
          _startingShift,
          ParamType.String,
        ),
        'shiftPeriod': serializeParam(
          _shiftPeriod,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShiftStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftStruct(
        startingShift: deserializeParam(
          data['startingShift'],
          ParamType.String,
          false,
        ),
        shiftPeriod: deserializeParam(
          data['shiftPeriod'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShiftStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShiftStruct &&
        startingShift == other.startingShift &&
        shiftPeriod == other.shiftPeriod;
  }

  @override
  int get hashCode => const ListEquality().hash([startingShift, shiftPeriod]);
}

ShiftStruct createShiftStruct({
  String? startingShift,
  String? shiftPeriod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShiftStruct(
      startingShift: startingShift,
      shiftPeriod: shiftPeriod,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShiftStruct? updateShiftStruct(
  ShiftStruct? shift, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shift
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShiftStructData(
  Map<String, dynamic> firestoreData,
  ShiftStruct? shift,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shift == null) {
    return;
  }
  if (shift.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shift.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shiftData = getShiftFirestoreData(shift, forFieldValue);
  final nestedData = shiftData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shift.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShiftFirestoreData(
  ShiftStruct? shift, [
  bool forFieldValue = false,
]) {
  if (shift == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shift.toMap());

  // Add any Firestore field values
  shift.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShiftListFirestoreData(
  List<ShiftStruct>? shifts,
) =>
    shifts?.map((e) => getShiftFirestoreData(e, true)).toList() ?? [];
