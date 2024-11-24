import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class StreetWorkersRecord extends FirestoreRecord {
  StreetWorkersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "worker_ref" field.
  DocumentReference? _workerRef;
  DocumentReference? get workerRef => _workerRef;
  bool hasWorkerRef() => _workerRef != null;

  void _initializeFields() {
    _workerRef = snapshotData['worker_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('street_workers');

  static Stream<StreetWorkersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreetWorkersRecord.fromSnapshot(s));

  static Future<StreetWorkersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreetWorkersRecord.fromSnapshot(s));

  static StreetWorkersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreetWorkersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreetWorkersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreetWorkersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreetWorkersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreetWorkersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreetWorkersRecordData({
  DocumentReference? workerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'worker_ref': workerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class StreetWorkersRecordDocumentEquality
    implements Equality<StreetWorkersRecord> {
  const StreetWorkersRecordDocumentEquality();

  @override
  bool equals(StreetWorkersRecord? e1, StreetWorkersRecord? e2) {
    return e1?.workerRef == e2?.workerRef;
  }

  @override
  int hash(StreetWorkersRecord? e) => const ListEquality().hash([e?.workerRef]);

  @override
  bool isValidKey(Object? o) => o is StreetWorkersRecord;
}
