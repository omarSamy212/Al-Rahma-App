import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectorsRecord extends FirestoreRecord {
  SectorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sectorName" field.
  String? _sectorName;
  String get sectorName => _sectorName ?? '';
  bool hasSectorName() => _sectorName != null;

  // "sectorDescription" field.
  String? _sectorDescription;
  String get sectorDescription => _sectorDescription ?? '';
  bool hasSectorDescription() => _sectorDescription != null;

  // "sectorID" field.
  String? _sectorID;
  String get sectorID => _sectorID ?? '';
  bool hasSectorID() => _sectorID != null;

  // "squaresList" field.
  List<DocumentReference>? _squaresList;
  List<DocumentReference> get squaresList => _squaresList ?? const [];
  bool hasSquaresList() => _squaresList != null;

  void _initializeFields() {
    _sectorName = snapshotData['sectorName'] as String?;
    _sectorDescription = snapshotData['sectorDescription'] as String?;
    _sectorID = snapshotData['sectorID'] as String?;
    _squaresList = getDataList(snapshotData['squaresList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Sectors');

  static Stream<SectorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SectorsRecord.fromSnapshot(s));

  static Future<SectorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SectorsRecord.fromSnapshot(s));

  static SectorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SectorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SectorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SectorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SectorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SectorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSectorsRecordData({
  String? sectorName,
  String? sectorDescription,
  String? sectorID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sectorName': sectorName,
      'sectorDescription': sectorDescription,
      'sectorID': sectorID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SectorsRecordDocumentEquality implements Equality<SectorsRecord> {
  const SectorsRecordDocumentEquality();

  @override
  bool equals(SectorsRecord? e1, SectorsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.sectorName == e2?.sectorName &&
        e1?.sectorDescription == e2?.sectorDescription &&
        e1?.sectorID == e2?.sectorID &&
        listEquality.equals(e1?.squaresList, e2?.squaresList);
  }

  @override
  int hash(SectorsRecord? e) => const ListEquality()
      .hash([e?.sectorName, e?.sectorDescription, e?.sectorID, e?.squaresList]);

  @override
  bool isValidKey(Object? o) => o is SectorsRecord;
}
