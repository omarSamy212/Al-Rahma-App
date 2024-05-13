// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChecksStruct extends FFFirebaseStruct {
  ChecksStruct({
    String? time,
    String? date,
    DateTime? datee,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _date = date,
        _datee = datee,
        super(firestoreUtilData);

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "datee" field.
  DateTime? _datee;
  DateTime? get datee => _datee;
  set datee(DateTime? val) => _datee = val;
  bool hasDatee() => _datee != null;

  static ChecksStruct fromMap(Map<String, dynamic> data) => ChecksStruct(
        time: data['time'] as String?,
        date: data['date'] as String?,
        datee: data['datee'] as DateTime?,
      );

  static ChecksStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChecksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'date': _date,
        'datee': _datee,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'datee': serializeParam(
          _datee,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChecksStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChecksStruct(
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        datee: deserializeParam(
          data['datee'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChecksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChecksStruct &&
        time == other.time &&
        date == other.date &&
        datee == other.datee;
  }

  @override
  int get hashCode => const ListEquality().hash([time, date, datee]);
}

ChecksStruct createChecksStruct({
  String? time,
  String? date,
  DateTime? datee,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChecksStruct(
      time: time,
      date: date,
      datee: datee,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChecksStruct? updateChecksStruct(
  ChecksStruct? checks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChecksStructData(
  Map<String, dynamic> firestoreData,
  ChecksStruct? checks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checks == null) {
    return;
  }
  if (checks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checksData = getChecksFirestoreData(checks, forFieldValue);
  final nestedData = checksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChecksFirestoreData(
  ChecksStruct? checks, [
  bool forFieldValue = false,
]) {
  if (checks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checks.toMap());

  // Add any Firestore field values
  checks.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChecksListFirestoreData(
  List<ChecksStruct>? checkss,
) =>
    checkss?.map((e) => getChecksFirestoreData(e, true)).toList() ?? [];
