import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class ChecksRecord extends FirestoreRecord {
  ChecksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "session_id" field.
  DocumentReference? _sessionId;
  DocumentReference? get sessionId => _sessionId;
  bool hasSessionId() => _sessionId != null;

  // "check_in" field.
  ChecksStruct? _checkIn;
  ChecksStruct get checkIn => _checkIn ?? ChecksStruct();
  bool hasCheckIn() => _checkIn != null;

  // "check_out" field.
  ChecksStruct? _checkOut;
  ChecksStruct get checkOut => _checkOut ?? ChecksStruct();
  bool hasCheckOut() => _checkOut != null;

  // "sector" field.
  DocumentReference? _sector;
  DocumentReference? get sector => _sector;
  bool hasSector() => _sector != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "attended_by" field.
  DocumentReference? _attendedBy;
  DocumentReference? get attendedBy => _attendedBy;
  bool hasAttendedBy() => _attendedBy != null;

  // "state" field.
  AttedanceState? _state;
  AttedanceState? get state => _state;
  bool hasState() => _state != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  void _initializeFields() {
    _sessionId = snapshotData['session_id'] as DocumentReference?;
    _checkIn = ChecksStruct.maybeFromMap(snapshotData['check_in']);
    _checkOut = ChecksStruct.maybeFromMap(snapshotData['check_out']);
    _sector = snapshotData['sector'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _attendedBy = snapshotData['attended_by'] as DocumentReference?;
    _state = deserializeEnum<AttedanceState>(snapshotData['state']);
    _userRole = snapshotData['user_role'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checks');

  static Stream<ChecksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChecksRecord.fromSnapshot(s));

  static Future<ChecksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChecksRecord.fromSnapshot(s));

  static ChecksRecord fromSnapshot(DocumentSnapshot snapshot) => ChecksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChecksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChecksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChecksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChecksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChecksRecordData({
  DocumentReference? sessionId,
  ChecksStruct? checkIn,
  ChecksStruct? checkOut,
  DocumentReference? sector,
  DocumentReference? userRef,
  DocumentReference? attendedBy,
  AttedanceState? state,
  String? userRole,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'session_id': sessionId,
      'check_in': ChecksStruct().toMap(),
      'check_out': ChecksStruct().toMap(),
      'sector': sector,
      'user_ref': userRef,
      'attended_by': attendedBy,
      'state': state,
      'user_role': userRole,
    }.withoutNulls,
  );

  // Handle nested data for "check_in" field.
  addChecksStructData(firestoreData, checkIn, 'check_in');

  // Handle nested data for "check_out" field.
  addChecksStructData(firestoreData, checkOut, 'check_out');

  return firestoreData;
}

class ChecksRecordDocumentEquality implements Equality<ChecksRecord> {
  const ChecksRecordDocumentEquality();

  @override
  bool equals(ChecksRecord? e1, ChecksRecord? e2) {
    return e1?.sessionId == e2?.sessionId &&
        e1?.checkIn == e2?.checkIn &&
        e1?.checkOut == e2?.checkOut &&
        e1?.sector == e2?.sector &&
        e1?.userRef == e2?.userRef &&
        e1?.attendedBy == e2?.attendedBy &&
        e1?.state == e2?.state &&
        e1?.userRole == e2?.userRole;
  }

  @override
  int hash(ChecksRecord? e) => const ListEquality().hash([
        e?.sessionId,
        e?.checkIn,
        e?.checkOut,
        e?.sector,
        e?.userRef,
        e?.attendedBy,
        e?.state,
        e?.userRole
      ]);

  @override
  bool isValidKey(Object? o) => o is ChecksRecord;
}
