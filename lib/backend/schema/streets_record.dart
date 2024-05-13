import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreetsRecord extends FirestoreRecord {
  StreetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "streetName" field.
  String? _streetName;
  String get streetName => _streetName ?? '';
  bool hasStreetName() => _streetName != null;

  // "streetDescription" field.
  String? _streetDescription;
  String get streetDescription => _streetDescription ?? '';
  bool hasStreetDescription() => _streetDescription != null;

  // "maxNumOfWorkers" field.
  int? _maxNumOfWorkers;
  int get maxNumOfWorkers => _maxNumOfWorkers ?? 0;
  bool hasMaxNumOfWorkers() => _maxNumOfWorkers != null;

  // "leaderRefrence" field.
  DocumentReference? _leaderRefrence;
  DocumentReference? get leaderRefrence => _leaderRefrence;
  bool hasLeaderRefrence() => _leaderRefrence != null;

  // "streetID" field.
  String? _streetID;
  String get streetID => _streetID ?? '';
  bool hasStreetID() => _streetID != null;

  // "streetLocation" field.
  GeoLocationStruct? _streetLocation;
  GeoLocationStruct get streetLocation =>
      _streetLocation ?? GeoLocationStruct();
  bool hasStreetLocation() => _streetLocation != null;

  // "fixed_point_workers" field.
  List<DocumentReference>? _fixedPointWorkers;
  List<DocumentReference> get fixedPointWorkers =>
      _fixedPointWorkers ?? const [];
  bool hasFixedPointWorkers() => _fixedPointWorkers != null;

  // "assignedWorkers" field.
  List<AssignWorkersStruct>? _assignedWorkers;
  List<AssignWorkersStruct> get assignedWorkers => _assignedWorkers ?? const [];
  bool hasAssignedWorkers() => _assignedWorkers != null;

  void _initializeFields() {
    _streetName = snapshotData['streetName'] as String?;
    _streetDescription = snapshotData['streetDescription'] as String?;
    _maxNumOfWorkers = castToType<int>(snapshotData['maxNumOfWorkers']);
    _leaderRefrence = snapshotData['leaderRefrence'] as DocumentReference?;
    _streetID = snapshotData['streetID'] as String?;
    _streetLocation =
        GeoLocationStruct.maybeFromMap(snapshotData['streetLocation']);
    _fixedPointWorkers = getDataList(snapshotData['fixed_point_workers']);
    _assignedWorkers = getStructList(
      snapshotData['assignedWorkers'],
      AssignWorkersStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Streets');

  static Stream<StreetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreetsRecord.fromSnapshot(s));

  static Future<StreetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreetsRecord.fromSnapshot(s));

  static StreetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreetsRecordData({
  String? streetName,
  String? streetDescription,
  int? maxNumOfWorkers,
  DocumentReference? leaderRefrence,
  String? streetID,
  GeoLocationStruct? streetLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'streetName': streetName,
      'streetDescription': streetDescription,
      'maxNumOfWorkers': maxNumOfWorkers,
      'leaderRefrence': leaderRefrence,
      'streetID': streetID,
      'streetLocation': GeoLocationStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "streetLocation" field.
  addGeoLocationStructData(firestoreData, streetLocation, 'streetLocation');

  return firestoreData;
}

class StreetsRecordDocumentEquality implements Equality<StreetsRecord> {
  const StreetsRecordDocumentEquality();

  @override
  bool equals(StreetsRecord? e1, StreetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.streetName == e2?.streetName &&
        e1?.streetDescription == e2?.streetDescription &&
        e1?.maxNumOfWorkers == e2?.maxNumOfWorkers &&
        e1?.leaderRefrence == e2?.leaderRefrence &&
        e1?.streetID == e2?.streetID &&
        e1?.streetLocation == e2?.streetLocation &&
        listEquality.equals(e1?.fixedPointWorkers, e2?.fixedPointWorkers) &&
        listEquality.equals(e1?.assignedWorkers, e2?.assignedWorkers);
  }

  @override
  int hash(StreetsRecord? e) => const ListEquality().hash([
        e?.streetName,
        e?.streetDescription,
        e?.maxNumOfWorkers,
        e?.leaderRefrence,
        e?.streetID,
        e?.streetLocation,
        e?.fixedPointWorkers,
        e?.assignedWorkers
      ]);

  @override
  bool isValidKey(Object? o) => o is StreetsRecord;
}
