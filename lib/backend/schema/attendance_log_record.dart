import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AttendanceLogRecord extends FirestoreRecord {
  AttendanceLogRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_checks" field.
  List<DocumentReference>? _userChecks;
  List<DocumentReference> get userChecks => _userChecks ?? const [];
  bool hasUserChecks() => _userChecks != null;

  void _initializeFields() {
    _userChecks = getDataList(snapshotData['user_checks']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance_log');

  static Stream<AttendanceLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceLogRecord.fromSnapshot(s));

  static Future<AttendanceLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceLogRecord.fromSnapshot(s));

  static AttendanceLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceLogRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AttendanceLogRecordDocumentEquality
    implements Equality<AttendanceLogRecord> {
  const AttendanceLogRecordDocumentEquality();

  @override
  bool equals(AttendanceLogRecord? e1, AttendanceLogRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userChecks, e2?.userChecks);
  }

  @override
  int hash(AttendanceLogRecord? e) =>
      const ListEquality().hash([e?.userChecks]);

  @override
  bool isValidKey(Object? o) => o is AttendanceLogRecord;
}
