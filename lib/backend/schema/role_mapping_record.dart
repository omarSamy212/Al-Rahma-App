import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleMappingRecord extends FirestoreRecord {
  RoleMappingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Tasks" field.
  List<DocumentReference>? _tasks;
  List<DocumentReference> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  // "role" field.
  DocumentReference? _role;
  DocumentReference? get role => _role;
  bool hasRole() => _role != null;

  void _initializeFields() {
    _tasks = getDataList(snapshotData['Tasks']);
    _role = snapshotData['role'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Role_Mapping');

  static Stream<RoleMappingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoleMappingRecord.fromSnapshot(s));

  static Future<RoleMappingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoleMappingRecord.fromSnapshot(s));

  static RoleMappingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoleMappingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoleMappingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoleMappingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoleMappingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoleMappingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoleMappingRecordData({
  DocumentReference? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoleMappingRecordDocumentEquality implements Equality<RoleMappingRecord> {
  const RoleMappingRecordDocumentEquality();

  @override
  bool equals(RoleMappingRecord? e1, RoleMappingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tasks, e2?.tasks) && e1?.role == e2?.role;
  }

  @override
  int hash(RoleMappingRecord? e) =>
      const ListEquality().hash([e?.tasks, e?.role]);

  @override
  bool isValidKey(Object? o) => o is RoleMappingRecord;
}
