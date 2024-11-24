import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AuthUserRecord extends FirestoreRecord {
  AuthUserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "userRefrence" field.
  DocumentReference? _userRefrence;
  DocumentReference? get userRefrence => _userRefrence;
  bool hasUserRefrence() => _userRefrence != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _userRefrence = snapshotData['userRefrence'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AuthUser');

  static Stream<AuthUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuthUserRecord.fromSnapshot(s));

  static Future<AuthUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuthUserRecord.fromSnapshot(s));

  static AuthUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuthUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuthUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuthUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuthUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuthUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuthUserRecordData({
  DateTime? createdTime,
  String? email,
  String? uid,
  DocumentReference? userRefrence,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'email': email,
      'uid': uid,
      'userRefrence': userRefrence,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuthUserRecordDocumentEquality implements Equality<AuthUserRecord> {
  const AuthUserRecordDocumentEquality();

  @override
  bool equals(AuthUserRecord? e1, AuthUserRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.userRefrence == e2?.userRefrence &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(AuthUserRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.email,
        e?.uid,
        e?.userRefrence,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is AuthUserRecord;
}
