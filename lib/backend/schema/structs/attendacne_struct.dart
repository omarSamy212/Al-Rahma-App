// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendacneStruct extends FFFirebaseStruct {
  AttendacneStruct({
    AttedanceState? attendanceState,
    DocumentReference? checkRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _attendanceState = attendanceState,
        _checkRef = checkRef,
        super(firestoreUtilData);

  // "attendance_state" field.
  AttedanceState? _attendanceState;
  AttedanceState get attendanceState =>
      _attendanceState ?? AttedanceState.waiting;
  set attendanceState(AttedanceState? val) => _attendanceState = val;
  bool hasAttendanceState() => _attendanceState != null;

  // "check_ref" field.
  DocumentReference? _checkRef;
  DocumentReference? get checkRef => _checkRef;
  set checkRef(DocumentReference? val) => _checkRef = val;
  bool hasCheckRef() => _checkRef != null;

  static AttendacneStruct fromMap(Map<String, dynamic> data) =>
      AttendacneStruct(
        attendanceState:
            deserializeEnum<AttedanceState>(data['attendance_state']),
        checkRef: data['check_ref'] as DocumentReference?,
      );

  static AttendacneStruct? maybeFromMap(dynamic data) => data is Map
      ? AttendacneStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'attendance_state': _attendanceState?.serialize(),
        'check_ref': _checkRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'attendance_state': serializeParam(
          _attendanceState,
          ParamType.Enum,
        ),
        'check_ref': serializeParam(
          _checkRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AttendacneStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttendacneStruct(
        attendanceState: deserializeParam<AttedanceState>(
          data['attendance_state'],
          ParamType.Enum,
          false,
        ),
        checkRef: deserializeParam(
          data['check_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['checks'],
        ),
      );

  @override
  String toString() => 'AttendacneStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendacneStruct &&
        attendanceState == other.attendanceState &&
        checkRef == other.checkRef;
  }

  @override
  int get hashCode => const ListEquality().hash([attendanceState, checkRef]);
}

AttendacneStruct createAttendacneStruct({
  AttedanceState? attendanceState,
  DocumentReference? checkRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttendacneStruct(
      attendanceState: attendanceState,
      checkRef: checkRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttendacneStruct? updateAttendacneStruct(
  AttendacneStruct? attendacne, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attendacne
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttendacneStructData(
  Map<String, dynamic> firestoreData,
  AttendacneStruct? attendacne,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attendacne == null) {
    return;
  }
  if (attendacne.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attendacne.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attendacneData = getAttendacneFirestoreData(attendacne, forFieldValue);
  final nestedData = attendacneData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attendacne.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttendacneFirestoreData(
  AttendacneStruct? attendacne, [
  bool forFieldValue = false,
]) {
  if (attendacne == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attendacne.toMap());

  // Add any Firestore field values
  attendacne.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttendacneListFirestoreData(
  List<AttendacneStruct>? attendacnes,
) =>
    attendacnes?.map((e) => getAttendacneFirestoreData(e, true)).toList() ?? [];
