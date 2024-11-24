import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectorsRecord extends FirestoreRecord {
  SectorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sectorName" field.
  String? _sectorName;
  String get sectorName => _sectorName ?? '';
  bool hasSectorName() => _sectorName != null;

  // "sectorID" field.
  String? _sectorID;
  String get sectorID => _sectorID ?? '';
  bool hasSectorID() => _sectorID != null;

  // "squaresList" field.
  List<DocumentReference>? _squaresList;
  List<DocumentReference> get squaresList => _squaresList ?? const [];
  bool hasSquaresList() => _squaresList != null;

  // "supervisors" field.
  List<DocumentReference>? _supervisors;
  List<DocumentReference> get supervisors => _supervisors ?? const [];
  bool hasSupervisors() => _supervisors != null;

  // "streetWorkersList" field.
  List<DocumentReference>? _streetWorkersList;
  List<DocumentReference> get streetWorkersList =>
      _streetWorkersList ?? const [];
  bool hasStreetWorkersList() => _streetWorkersList != null;

  // "numOfNeededWorkers" field.
  int? _numOfNeededWorkers;
  int get numOfNeededWorkers => _numOfNeededWorkers ?? 0;
  bool hasNumOfNeededWorkers() => _numOfNeededWorkers != null;

  // "numOfNeededSupervisors" field.
  int? _numOfNeededSupervisors;
  int get numOfNeededSupervisors => _numOfNeededSupervisors ?? 0;
  bool hasNumOfNeededSupervisors() => _numOfNeededSupervisors != null;

  void _initializeFields() {
    _sectorName = snapshotData['sectorName'] as String?;
    _sectorID = snapshotData['sectorID'] as String?;
    _squaresList = getDataList(snapshotData['squaresList']);
    _supervisors = getDataList(snapshotData['supervisors']);
    _streetWorkersList = getDataList(snapshotData['streetWorkersList']);
    _numOfNeededWorkers = castToType<int>(snapshotData['numOfNeededWorkers']);
    _numOfNeededSupervisors =
        castToType<int>(snapshotData['numOfNeededSupervisors']);
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
  String? sectorID,
  int? numOfNeededWorkers,
  int? numOfNeededSupervisors,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sectorName': sectorName,
      'sectorID': sectorID,
      'numOfNeededWorkers': numOfNeededWorkers,
      'numOfNeededSupervisors': numOfNeededSupervisors,
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
        e1?.sectorID == e2?.sectorID &&
        listEquality.equals(e1?.squaresList, e2?.squaresList) &&
        listEquality.equals(e1?.supervisors, e2?.supervisors) &&
        listEquality.equals(e1?.streetWorkersList, e2?.streetWorkersList) &&
        e1?.numOfNeededWorkers == e2?.numOfNeededWorkers &&
        e1?.numOfNeededSupervisors == e2?.numOfNeededSupervisors;
  }

  @override
  int hash(SectorsRecord? e) => const ListEquality().hash([
        e?.sectorName,
        e?.sectorID,
        e?.squaresList,
        e?.supervisors,
        e?.streetWorkersList,
        e?.numOfNeededWorkers,
        e?.numOfNeededSupervisors
      ]);

  @override
  bool isValidKey(Object? o) => o is SectorsRecord;
}
