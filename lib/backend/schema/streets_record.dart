import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreetsRecord extends FirestoreRecord {
  StreetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "usersList" field.
  List<DocumentReference>? _usersList;
  List<DocumentReference> get usersList => _usersList ?? const [];
  bool hasUsersList() => _usersList != null;

  // "leaderRefrence" field.
  DocumentReference? _leaderRefrence;
  DocumentReference? get leaderRefrence => _leaderRefrence;
  bool hasLeaderRefrence() => _leaderRefrence != null;

  // "streetID" field.
  String? _streetID;
  String get streetID => _streetID ?? '';
  bool hasStreetID() => _streetID != null;

  // "streetLocation" field.
  LatLng? _streetLocation;
  LatLng? get streetLocation => _streetLocation;
  bool hasStreetLocation() => _streetLocation != null;

  void _initializeFields() {
    _streetName = snapshotData['streetName'] as String?;
    _streetDescription = snapshotData['streetDescription'] as String?;
    _maxNumOfWorkers = castToType<int>(snapshotData['maxNumOfWorkers']);
    _usersList = getDataList(snapshotData['usersList']);
    _leaderRefrence = snapshotData['leaderRefrence'] as DocumentReference?;
    _streetID = snapshotData['streetID'] as String?;
    _streetLocation = snapshotData['streetLocation'] as LatLng?;
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
  LatLng? streetLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'streetName': streetName,
      'streetDescription': streetDescription,
      'maxNumOfWorkers': maxNumOfWorkers,
      'leaderRefrence': leaderRefrence,
      'streetID': streetID,
      'streetLocation': streetLocation,
    }.withoutNulls,
  );

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
        listEquality.equals(e1?.usersList, e2?.usersList) &&
        e1?.leaderRefrence == e2?.leaderRefrence &&
        e1?.streetID == e2?.streetID &&
        e1?.streetLocation == e2?.streetLocation;
  }

  @override
  int hash(StreetsRecord? e) => const ListEquality().hash([
        e?.streetName,
        e?.streetDescription,
        e?.maxNumOfWorkers,
        e?.usersList,
        e?.leaderRefrence,
        e?.streetID,
        e?.streetLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is StreetsRecord;
}
