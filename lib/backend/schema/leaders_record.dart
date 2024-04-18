import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadersRecord extends FirestoreRecord {
  LeadersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "leaderName" field.
  String? _leaderName;
  String get leaderName => _leaderName ?? '';
  bool hasLeaderName() => _leaderName != null;

  // "streetsList" field.
  List<DocumentReference>? _streetsList;
  List<DocumentReference> get streetsList => _streetsList ?? const [];
  bool hasStreetsList() => _streetsList != null;

  // "leaderID" field.
  String? _leaderID;
  String get leaderID => _leaderID ?? '';
  bool hasLeaderID() => _leaderID != null;

  // "squareRefrence" field.
  DocumentReference? _squareRefrence;
  DocumentReference? get squareRefrence => _squareRefrence;
  bool hasSquareRefrence() => _squareRefrence != null;

  void _initializeFields() {
    _leaderName = snapshotData['leaderName'] as String?;
    _streetsList = getDataList(snapshotData['streetsList']);
    _leaderID = snapshotData['leaderID'] as String?;
    _squareRefrence = snapshotData['squareRefrence'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Leaders');

  static Stream<LeadersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadersRecord.fromSnapshot(s));

  static Future<LeadersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadersRecord.fromSnapshot(s));

  static LeadersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadersRecordData({
  String? leaderName,
  String? leaderID,
  DocumentReference? squareRefrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'leaderName': leaderName,
      'leaderID': leaderID,
      'squareRefrence': squareRefrence,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadersRecordDocumentEquality implements Equality<LeadersRecord> {
  const LeadersRecordDocumentEquality();

  @override
  bool equals(LeadersRecord? e1, LeadersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.leaderName == e2?.leaderName &&
        listEquality.equals(e1?.streetsList, e2?.streetsList) &&
        e1?.leaderID == e2?.leaderID &&
        e1?.squareRefrence == e2?.squareRefrence;
  }

  @override
  int hash(LeadersRecord? e) => const ListEquality()
      .hash([e?.leaderName, e?.streetsList, e?.leaderID, e?.squareRefrence]);

  @override
  bool isValidKey(Object? o) => o is LeadersRecord;
}
