import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRolesRecord extends FirestoreRecord {
  UserRolesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "roleID" field.
  DocumentReference? _roleID;
  DocumentReference? get roleID => _roleID;
  bool hasRoleID() => _roleID != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _roleID = snapshotData['roleID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userRoles');

  static Stream<UserRolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRolesRecord.fromSnapshot(s));

  static Future<UserRolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRolesRecord.fromSnapshot(s));

  static UserRolesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRolesRecordData({
  DocumentReference? userID,
  DocumentReference? roleID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'roleID': roleID,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRolesRecordDocumentEquality implements Equality<UserRolesRecord> {
  const UserRolesRecordDocumentEquality();

  @override
  bool equals(UserRolesRecord? e1, UserRolesRecord? e2) {
    return e1?.userID == e2?.userID && e1?.roleID == e2?.roleID;
  }

  @override
  int hash(UserRolesRecord? e) =>
      const ListEquality().hash([e?.userID, e?.roleID]);

  @override
  bool isValidKey(Object? o) => o is UserRolesRecord;
}
