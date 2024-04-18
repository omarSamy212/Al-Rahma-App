import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SquaresRecord extends FirestoreRecord {
  SquaresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "squareName" field.
  String? _squareName;
  String get squareName => _squareName ?? '';
  bool hasSquareName() => _squareName != null;

  // "leadersList" field.
  List<DocumentReference>? _leadersList;
  List<DocumentReference> get leadersList => _leadersList ?? const [];
  bool hasLeadersList() => _leadersList != null;

  // "sectorRefrence" field.
  DocumentReference? _sectorRefrence;
  DocumentReference? get sectorRefrence => _sectorRefrence;
  bool hasSectorRefrence() => _sectorRefrence != null;

  // "squareID" field.
  String? _squareID;
  String get squareID => _squareID ?? '';
  bool hasSquareID() => _squareID != null;

  void _initializeFields() {
    _squareName = snapshotData['squareName'] as String?;
    _leadersList = getDataList(snapshotData['leadersList']);
    _sectorRefrence = snapshotData['sectorRefrence'] as DocumentReference?;
    _squareID = snapshotData['squareID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Squares');

  static Stream<SquaresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SquaresRecord.fromSnapshot(s));

  static Future<SquaresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SquaresRecord.fromSnapshot(s));

  static SquaresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SquaresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SquaresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SquaresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SquaresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SquaresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSquaresRecordData({
  String? squareName,
  DocumentReference? sectorRefrence,
  String? squareID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'squareName': squareName,
      'sectorRefrence': sectorRefrence,
      'squareID': squareID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SquaresRecordDocumentEquality implements Equality<SquaresRecord> {
  const SquaresRecordDocumentEquality();

  @override
  bool equals(SquaresRecord? e1, SquaresRecord? e2) {
    const listEquality = ListEquality();
    return e1?.squareName == e2?.squareName &&
        listEquality.equals(e1?.leadersList, e2?.leadersList) &&
        e1?.sectorRefrence == e2?.sectorRefrence &&
        e1?.squareID == e2?.squareID;
  }

  @override
  int hash(SquaresRecord? e) => const ListEquality()
      .hash([e?.squareName, e?.leadersList, e?.sectorRefrence, e?.squareID]);

  @override
  bool isValidKey(Object? o) => o is SquaresRecord;
}
