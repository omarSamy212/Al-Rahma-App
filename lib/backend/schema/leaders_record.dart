import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadersRecord extends FirestoreRecord {
  LeadersRecord._(
    super.reference,
    super.data,
  ) {
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

  // "leaderDescription" field.
  String? _leaderDescription;
  String get leaderDescription => _leaderDescription ?? '';
  bool hasLeaderDescription() => _leaderDescription != null;

  // "supervisorMain" field.
  DocumentReference? _supervisorMain;
  DocumentReference? get supervisorMain => _supervisorMain;
  bool hasSupervisorMain() => _supervisorMain != null;

  // "supervisorSecondary" field.
  DocumentReference? _supervisorSecondary;
  DocumentReference? get supervisorSecondary => _supervisorSecondary;
  bool hasSupervisorSecondary() => _supervisorSecondary != null;

  // "leaderOldName" field.
  String? _leaderOldName;
  String get leaderOldName => _leaderOldName ?? '';
  bool hasLeaderOldName() => _leaderOldName != null;

  // "numOfNeededWorkers" field.
  int? _numOfNeededWorkers;
  int get numOfNeededWorkers => _numOfNeededWorkers ?? 0;
  bool hasNumOfNeededWorkers() => _numOfNeededWorkers != null;

  // "workers_List" field.
  List<DocumentReference>? _workersList;
  List<DocumentReference> get workersList => _workersList ?? const [];
  bool hasWorkersList() => _workersList != null;

  // "availableWorkers" field.
  List<DocumentReference>? _availableWorkers;
  List<DocumentReference> get availableWorkers => _availableWorkers ?? const [];
  bool hasAvailableWorkers() => _availableWorkers != null;

  // "sectorID" field.
  String? _sectorID;
  String get sectorID => _sectorID ?? '';
  bool hasSectorID() => _sectorID != null;

  void _initializeFields() {
    _leaderName = snapshotData['leaderName'] as String?;
    _streetsList = getDataList(snapshotData['streetsList']);
    _leaderID = snapshotData['leaderID'] as String?;
    _squareRefrence = snapshotData['squareRefrence'] as DocumentReference?;
    _leaderDescription = snapshotData['leaderDescription'] as String?;
    _supervisorMain = snapshotData['supervisorMain'] as DocumentReference?;
    _supervisorSecondary =
        snapshotData['supervisorSecondary'] as DocumentReference?;
    _leaderOldName = snapshotData['leaderOldName'] as String?;
    _numOfNeededWorkers = castToType<int>(snapshotData['numOfNeededWorkers']);
    _workersList = getDataList(snapshotData['workers_List']);
    _availableWorkers = getDataList(snapshotData['availableWorkers']);
    _sectorID = snapshotData['sectorID'] as String?;
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
  String? leaderDescription,
  DocumentReference? supervisorMain,
  DocumentReference? supervisorSecondary,
  String? leaderOldName,
  int? numOfNeededWorkers,
  String? sectorID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'leaderName': leaderName,
      'leaderID': leaderID,
      'squareRefrence': squareRefrence,
      'leaderDescription': leaderDescription,
      'supervisorMain': supervisorMain,
      'supervisorSecondary': supervisorSecondary,
      'leaderOldName': leaderOldName,
      'numOfNeededWorkers': numOfNeededWorkers,
      'sectorID': sectorID,
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
        e1?.squareRefrence == e2?.squareRefrence &&
        e1?.leaderDescription == e2?.leaderDescription &&
        e1?.supervisorMain == e2?.supervisorMain &&
        e1?.supervisorSecondary == e2?.supervisorSecondary &&
        e1?.leaderOldName == e2?.leaderOldName &&
        e1?.numOfNeededWorkers == e2?.numOfNeededWorkers &&
        listEquality.equals(e1?.workersList, e2?.workersList) &&
        listEquality.equals(e1?.availableWorkers, e2?.availableWorkers) &&
        e1?.sectorID == e2?.sectorID;
  }

  @override
  int hash(LeadersRecord? e) => const ListEquality().hash([
        e?.leaderName,
        e?.streetsList,
        e?.leaderID,
        e?.squareRefrence,
        e?.leaderDescription,
        e?.supervisorMain,
        e?.supervisorSecondary,
        e?.leaderOldName,
        e?.numOfNeededWorkers,
        e?.workersList,
        e?.availableWorkers,
        e?.sectorID
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadersRecord;
}
