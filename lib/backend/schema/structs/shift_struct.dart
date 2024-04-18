// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftStruct extends FFFirebaseStruct {
  ShiftStruct({
    String? shiftPeriod,
    String? startShift,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _shiftPeriod = shiftPeriod,
        _startShift = startShift,
        super(firestoreUtilData);

  // "shiftPeriod" field.
  String? _shiftPeriod;
  String get shiftPeriod => _shiftPeriod ?? '';
  set shiftPeriod(String? val) => _shiftPeriod = val;
  bool hasShiftPeriod() => _shiftPeriod != null;

  // "startShift" field.
  String? _startShift;
  String get startShift => _startShift ?? '';
  set startShift(String? val) => _startShift = val;
  bool hasStartShift() => _startShift != null;

  static ShiftStruct fromMap(Map<String, dynamic> data) => ShiftStruct(
        shiftPeriod: data['shiftPeriod'] as String?,
        startShift: data['startShift'] as String?,
      );

  static ShiftStruct? maybeFromMap(dynamic data) =>
      data is Map ? ShiftStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'shiftPeriod': _shiftPeriod,
        'startShift': _startShift,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'shiftPeriod': serializeParam(
          _shiftPeriod,
          ParamType.String,
        ),
        'startShift': serializeParam(
          _startShift,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShiftStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftStruct(
        shiftPeriod: deserializeParam(
          data['shiftPeriod'],
          ParamType.String,
          false,
        ),
        startShift: deserializeParam(
          data['startShift'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShiftStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShiftStruct &&
        shiftPeriod == other.shiftPeriod &&
        startShift == other.startShift;
  }

  @override
  int get hashCode => const ListEquality().hash([shiftPeriod, startShift]);
}

ShiftStruct createShiftStruct({
  String? shiftPeriod,
  String? startShift,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShiftStruct(
      shiftPeriod: shiftPeriod,
      startShift: startShift,
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
