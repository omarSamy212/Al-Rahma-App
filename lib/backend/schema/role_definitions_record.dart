import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RoleDefinitionsRecord extends FirestoreRecord {
  RoleDefinitionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "roleName" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  bool hasRoleName() => _roleName != null;

  // "role_tasks" field.
  List<DocumentReference>? _roleTasks;
  List<DocumentReference> get roleTasks => _roleTasks ?? const [];
  bool hasRoleTasks() => _roleTasks != null;

  void _initializeFields() {
    _roleName = snapshotData['roleName'] as String?;
    _roleTasks = getDataList(snapshotData['role_tasks']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('roleDefinitions');

  static Stream<RoleDefinitionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoleDefinitionsRecord.fromSnapshot(s));

  static Future<RoleDefinitionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoleDefinitionsRecord.fromSnapshot(s));

  static RoleDefinitionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoleDefinitionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoleDefinitionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoleDefinitionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoleDefinitionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoleDefinitionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoleDefinitionsRecordData({
  String? roleName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'roleName': roleName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoleDefinitionsRecordDocumentEquality
    implements Equality<RoleDefinitionsRecord> {
  const RoleDefinitionsRecordDocumentEquality();

  @override
  bool equals(RoleDefinitionsRecord? e1, RoleDefinitionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.roleName == e2?.roleName &&
        listEquality.equals(e1?.roleTasks, e2?.roleTasks);
  }

  @override
  int hash(RoleDefinitionsRecord? e) =>
      const ListEquality().hash([e?.roleName, e?.roleTasks]);

  @override
  bool isValidKey(Object? o) => o is RoleDefinitionsRecord;
}
