import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "session_name" field.
  String? _sessionName;
  String get sessionName => _sessionName ?? '';
  bool hasSessionName() => _sessionName != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "qr_code_value" field.
  String? _qrCodeValue;
  String get qrCodeValue => _qrCodeValue ?? '';
  bool hasQrCodeValue() => _qrCodeValue != null;

  // "workers_attended" field.
  List<DocumentReference>? _workersAttended;
  List<DocumentReference> get workersAttended => _workersAttended ?? const [];
  bool hasWorkersAttended() => _workersAttended != null;

  // "other_attended" field.
  List<DocumentReference>? _otherAttended;
  List<DocumentReference> get otherAttended => _otherAttended ?? const [];
  bool hasOtherAttended() => _otherAttended != null;

  // "supervisor_attended" field.
  List<DocumentReference>? _supervisorAttended;
  List<DocumentReference> get supervisorAttended =>
      _supervisorAttended ?? const [];
  bool hasSupervisorAttended() => _supervisorAttended != null;

  void _initializeFields() {
    _sessionId = snapshotData['session_id'] as String?;
    _sessionName = snapshotData['session_name'] as String?;
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _qrCodeValue = snapshotData['qr_code_value'] as String?;
    _workersAttended = getDataList(snapshotData['workers_attended']);
    _otherAttended = getDataList(snapshotData['other_attended']);
    _supervisorAttended = getDataList(snapshotData['supervisor_attended']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  String? sessionId,
  String? sessionName,
  DateTime? startTime,
  DateTime? endTime,
  String? qrCodeValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'session_id': sessionId,
      'session_name': sessionName,
      'start_time': startTime,
      'end_time': endTime,
      'qr_code_value': qrCodeValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.sessionId == e2?.sessionId &&
        e1?.sessionName == e2?.sessionName &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.qrCodeValue == e2?.qrCodeValue &&
        listEquality.equals(e1?.workersAttended, e2?.workersAttended) &&
        listEquality.equals(e1?.otherAttended, e2?.otherAttended) &&
        listEquality.equals(e1?.supervisorAttended, e2?.supervisorAttended);
  }

  @override
  int hash(SessionsRecord? e) => const ListEquality().hash([
        e?.sessionId,
        e?.sessionName,
        e?.startTime,
        e?.endTime,
        e?.qrCodeValue,
        e?.workersAttended,
        e?.otherAttended,
        e?.supervisorAttended
      ]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}
