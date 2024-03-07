import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "contractorRef" field.
  DocumentReference? _contractorRef;
  DocumentReference? get contractorRef => _contractorRef;
  bool hasContractorRef() => _contractorRef != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "middleName" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  bool hasMiddleName() => _middleName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "government" field.
  String? _government;
  String get government => _government ?? '';
  bool hasGovernment() => _government != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "fullAddress" field.
  String? _fullAddress;
  String get fullAddress => _fullAddress ?? '';
  bool hasFullAddress() => _fullAddress != null;

  // "socialStatus" field.
  String? _socialStatus;
  String get socialStatus => _socialStatus ?? '';
  bool hasSocialStatus() => _socialStatus != null;

  // "nationalID" field.
  String? _nationalID;
  String get nationalID => _nationalID ?? '';
  bool hasNationalID() => _nationalID != null;

  // "employmentDate" field.
  DateTime? _employmentDate;
  DateTime? get employmentDate => _employmentDate;
  bool hasEmploymentDate() => _employmentDate != null;

  // "shiftPeriod" field.
  String? _shiftPeriod;
  String get shiftPeriod => _shiftPeriod ?? '';
  bool hasShiftPeriod() => _shiftPeriod != null;

  // "userCode" field.
  String? _userCode;
  String get userCode => _userCode ?? '';
  bool hasUserCode() => _userCode != null;

  // "userRole" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "accountStatus" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  bool hasAccountStatus() => _accountStatus != null;

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

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _contractorRef = snapshotData['contractorRef'] as DocumentReference?;
    _firstName = snapshotData['firstName'] as String?;
    _middleName = snapshotData['middleName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _gender = snapshotData['gender'] as String?;
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _country = snapshotData['country'] as String?;
    _government = snapshotData['government'] as String?;
    _city = snapshotData['city'] as String?;
    _fullAddress = snapshotData['fullAddress'] as String?;
    _socialStatus = snapshotData['socialStatus'] as String?;
    _nationalID = snapshotData['nationalID'] as String?;
    _employmentDate = snapshotData['employmentDate'] as DateTime?;
    _shiftPeriod = snapshotData['shiftPeriod'] as String?;
    _userCode = snapshotData['userCode'] as String?;
    _userRole = snapshotData['userRole'] as String?;
    _accountStatus = snapshotData['accountStatus'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  DateTime? createdTime,
  DocumentReference? contractorRef,
  String? firstName,
  String? middleName,
  String? lastName,
  String? gender,
  DateTime? birthdate,
  String? country,
  String? government,
  String? city,
  String? fullAddress,
  String? socialStatus,
  String? nationalID,
  DateTime? employmentDate,
  String? shiftPeriod,
  String? userCode,
  String? userRole,
  String? accountStatus,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'contractorRef': contractorRef,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'birthdate': birthdate,
      'country': country,
      'government': government,
      'city': city,
      'fullAddress': fullAddress,
      'socialStatus': socialStatus,
      'nationalID': nationalID,
      'employmentDate': employmentDate,
      'shiftPeriod': shiftPeriod,
      'userCode': userCode,
      'userRole': userRole,
      'accountStatus': accountStatus,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.contractorRef == e2?.contractorRef &&
        e1?.firstName == e2?.firstName &&
        e1?.middleName == e2?.middleName &&
        e1?.lastName == e2?.lastName &&
        e1?.gender == e2?.gender &&
        e1?.birthdate == e2?.birthdate &&
        e1?.country == e2?.country &&
        e1?.government == e2?.government &&
        e1?.city == e2?.city &&
        e1?.fullAddress == e2?.fullAddress &&
        e1?.socialStatus == e2?.socialStatus &&
        e1?.nationalID == e2?.nationalID &&
        e1?.employmentDate == e2?.employmentDate &&
        e1?.shiftPeriod == e2?.shiftPeriod &&
        e1?.userCode == e2?.userCode &&
        e1?.userRole == e2?.userRole &&
        e1?.accountStatus == e2?.accountStatus &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.contractorRef,
        e?.firstName,
        e?.middleName,
        e?.lastName,
        e?.gender,
        e?.birthdate,
        e?.country,
        e?.government,
        e?.city,
        e?.fullAddress,
        e?.socialStatus,
        e?.nationalID,
        e?.employmentDate,
        e?.shiftPeriod,
        e?.userCode,
        e?.userRole,
        e?.accountStatus,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
