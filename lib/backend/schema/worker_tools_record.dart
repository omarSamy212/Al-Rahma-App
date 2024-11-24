import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WorkerToolsRecord extends FirestoreRecord {
  WorkerToolsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workerTools');

  static Stream<WorkerToolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerToolsRecord.fromSnapshot(s));

  static Future<WorkerToolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerToolsRecord.fromSnapshot(s));

  static WorkerToolsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkerToolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerToolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerToolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerToolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerToolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerToolsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerToolsRecordDocumentEquality implements Equality<WorkerToolsRecord> {
  const WorkerToolsRecordDocumentEquality();

  @override
  bool equals(WorkerToolsRecord? e1, WorkerToolsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(WorkerToolsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is WorkerToolsRecord;
}
