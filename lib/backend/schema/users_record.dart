import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "userCode" field.
  String? _userCode;
  String get userCode => _userCode ?? '';
  bool hasUserCode() => _userCode != null;

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

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  bool hasBirthdate() => _birthdate != null;

  // "front_nat_image_url" field.
  String? _frontNatImageUrl;
  String get frontNatImageUrl => _frontNatImageUrl ?? '';
  bool hasFrontNatImageUrl() => _frontNatImageUrl != null;

  // "back_nat_image_url" field.
  String? _backNatImageUrl;
  String get backNatImageUrl => _backNatImageUrl ?? '';
  bool hasBackNatImageUrl() => _backNatImageUrl != null;

  // "drug_test_image_url" field.
  String? _drugTestImageUrl;
  String get drugTestImageUrl => _drugTestImageUrl ?? '';
  bool hasDrugTestImageUrl() => _drugTestImageUrl != null;

  // "front_driving_licence" field.
  String? _frontDrivingLicence;
  String get frontDrivingLicence => _frontDrivingLicence ?? '';
  bool hasFrontDrivingLicence() => _frontDrivingLicence != null;

  // "back_driving_licence" field.
  String? _backDrivingLicence;
  String get backDrivingLicence => _backDrivingLicence ?? '';
  bool hasBackDrivingLicence() => _backDrivingLicence != null;

  // "privileges" field.
  UserPrivilegesStruct? _privileges;
  UserPrivilegesStruct get privileges => _privileges ?? UserPrivilegesStruct();
  bool hasPrivileges() => _privileges != null;

  // "shift" field.
  ShiftStruct? _shift;
  ShiftStruct get shift => _shift ?? ShiftStruct();
  bool hasShift() => _shift != null;

  // "national_information" field.
  NationalInformationStruct? _nationalInformation;
  NationalInformationStruct get nationalInformation =>
      _nationalInformation ?? NationalInformationStruct();
  bool hasNationalInformation() => _nationalInformation != null;

  // "driving_information" field.
  DrivingInformationStruct? _drivingInformation;
  DrivingInformationStruct get drivingInformation =>
      _drivingInformation ?? DrivingInformationStruct();
  bool hasDrivingInformation() => _drivingInformation != null;

  // "relegion" field.
  String? _relegion;
  String get relegion => _relegion ?? '';
  bool hasRelegion() => _relegion != null;

  // "educationData" field.
  String? _educationData;
  String get educationData => _educationData ?? '';
  bool hasEducationData() => _educationData != null;

  // "isEmployed" field.
  String? _isEmployed;
  String get isEmployed => _isEmployed ?? '';
  bool hasIsEmployed() => _isEmployed != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "is_driver" field.
  bool? _isDriver;
  bool get isDriver => _isDriver ?? false;
  bool hasIsDriver() => _isDriver != null;

  // "employmentDate" field.
  String? _employmentDate;
  String get employmentDate => _employmentDate ?? '';
  bool hasEmploymentDate() => _employmentDate != null;

  // "contractorRef" field.
  DocumentReference? _contractorRef;
  DocumentReference? get contractorRef => _contractorRef;
  bool hasContractorRef() => _contractorRef != null;

  // "leaderAreaRefrence1" field.
  DocumentReference? _leaderAreaRefrence1;
  DocumentReference? get leaderAreaRefrence1 => _leaderAreaRefrence1;
  bool hasLeaderAreaRefrence1() => _leaderAreaRefrence1 != null;

  // "leaderAreaRefrence2" field.
  DocumentReference? _leaderAreaRefrence2;
  DocumentReference? get leaderAreaRefrence2 => _leaderAreaRefrence2;
  bool hasLeaderAreaRefrence2() => _leaderAreaRefrence2 != null;

  // "is_attend" field.
  bool? _isAttend;
  bool get isAttend => _isAttend ?? false;
  bool hasIsAttend() => _isAttend != null;

  // "attendance_state" field.
  AttedanceState? _attendanceState;
  AttedanceState? get attendanceState => _attendanceState;
  bool hasAttendanceState() => _attendanceState != null;

  // "attendance" field.
  AttendacneStruct? _attendance;
  AttendacneStruct get attendance => _attendance ?? AttendacneStruct();
  bool hasAttendance() => _attendance != null;

  // "job_code" field.
  String? _jobCode;
  String get jobCode => _jobCode ?? '';
  bool hasJobCode() => _jobCode != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _firstName = snapshotData['firstName'] as String?;
    _middleName = snapshotData['middleName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _gender = snapshotData['gender'] as String?;
    _government = snapshotData['government'] as String?;
    _city = snapshotData['city'] as String?;
    _fullAddress = snapshotData['fullAddress'] as String?;
    _socialStatus = snapshotData['socialStatus'] as String?;
    _userCode = snapshotData['userCode'] as String?;
    _accountStatus = snapshotData['accountStatus'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _birthdate = snapshotData['birthdate'] as String?;
    _frontNatImageUrl = snapshotData['front_nat_image_url'] as String?;
    _backNatImageUrl = snapshotData['back_nat_image_url'] as String?;
    _drugTestImageUrl = snapshotData['drug_test_image_url'] as String?;
    _frontDrivingLicence = snapshotData['front_driving_licence'] as String?;
    _backDrivingLicence = snapshotData['back_driving_licence'] as String?;
    _privileges = UserPrivilegesStruct.maybeFromMap(snapshotData['privileges']);
    _shift = ShiftStruct.maybeFromMap(snapshotData['shift']);
    _nationalInformation = NationalInformationStruct.maybeFromMap(
        snapshotData['national_information']);
    _drivingInformation = DrivingInformationStruct.maybeFromMap(
        snapshotData['driving_information']);
    _relegion = snapshotData['relegion'] as String?;
    _educationData = snapshotData['educationData'] as String?;
    _isEmployed = snapshotData['isEmployed'] as String?;
    _createdBy = snapshotData['created_by'] as String?;
    _isDriver = snapshotData['is_driver'] as bool?;
    _employmentDate = snapshotData['employmentDate'] as String?;
    _contractorRef = snapshotData['contractorRef'] as DocumentReference?;
    _leaderAreaRefrence1 =
        snapshotData['leaderAreaRefrence1'] as DocumentReference?;
    _leaderAreaRefrence2 =
        snapshotData['leaderAreaRefrence2'] as DocumentReference?;
    _isAttend = snapshotData['is_attend'] as bool?;
    _attendanceState =
        deserializeEnum<AttedanceState>(snapshotData['attendance_state']);
    _attendance = AttendacneStruct.maybeFromMap(snapshotData['attendance']);
    _jobCode = snapshotData['job_code'] as String?;
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
  String? firstName,
  String? middleName,
  String? lastName,
  String? gender,
  String? government,
  String? city,
  String? fullAddress,
  String? socialStatus,
  String? userCode,
  String? accountStatus,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? uid,
  String? birthdate,
  String? frontNatImageUrl,
  String? backNatImageUrl,
  String? drugTestImageUrl,
  String? frontDrivingLicence,
  String? backDrivingLicence,
  UserPrivilegesStruct? privileges,
  ShiftStruct? shift,
  NationalInformationStruct? nationalInformation,
  DrivingInformationStruct? drivingInformation,
  String? relegion,
  String? educationData,
  String? isEmployed,
  String? createdBy,
  bool? isDriver,
  String? employmentDate,
  DocumentReference? contractorRef,
  DocumentReference? leaderAreaRefrence1,
  DocumentReference? leaderAreaRefrence2,
  bool? isAttend,
  AttedanceState? attendanceState,
  AttendacneStruct? attendance,
  String? jobCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'government': government,
      'city': city,
      'fullAddress': fullAddress,
      'socialStatus': socialStatus,
      'userCode': userCode,
      'accountStatus': accountStatus,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'uid': uid,
      'birthdate': birthdate,
      'front_nat_image_url': frontNatImageUrl,
      'back_nat_image_url': backNatImageUrl,
      'drug_test_image_url': drugTestImageUrl,
      'front_driving_licence': frontDrivingLicence,
      'back_driving_licence': backDrivingLicence,
      'privileges': UserPrivilegesStruct().toMap(),
      'shift': ShiftStruct().toMap(),
      'national_information': NationalInformationStruct().toMap(),
      'driving_information': DrivingInformationStruct().toMap(),
      'relegion': relegion,
      'educationData': educationData,
      'isEmployed': isEmployed,
      'created_by': createdBy,
      'is_driver': isDriver,
      'employmentDate': employmentDate,
      'contractorRef': contractorRef,
      'leaderAreaRefrence1': leaderAreaRefrence1,
      'leaderAreaRefrence2': leaderAreaRefrence2,
      'is_attend': isAttend,
      'attendance_state': attendanceState,
      'attendance': AttendacneStruct().toMap(),
      'job_code': jobCode,
    }.withoutNulls,
  );

  // Handle nested data for "privileges" field.
  addUserPrivilegesStructData(firestoreData, privileges, 'privileges');

  // Handle nested data for "shift" field.
  addShiftStructData(firestoreData, shift, 'shift');

  // Handle nested data for "national_information" field.
  addNationalInformationStructData(
      firestoreData, nationalInformation, 'national_information');

  // Handle nested data for "driving_information" field.
  addDrivingInformationStructData(
      firestoreData, drivingInformation, 'driving_information');

  // Handle nested data for "attendance" field.
  addAttendacneStructData(firestoreData, attendance, 'attendance');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.firstName == e2?.firstName &&
        e1?.middleName == e2?.middleName &&
        e1?.lastName == e2?.lastName &&
        e1?.gender == e2?.gender &&
        e1?.government == e2?.government &&
        e1?.city == e2?.city &&
        e1?.fullAddress == e2?.fullAddress &&
        e1?.socialStatus == e2?.socialStatus &&
        e1?.userCode == e2?.userCode &&
        e1?.accountStatus == e2?.accountStatus &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.birthdate == e2?.birthdate &&
        e1?.frontNatImageUrl == e2?.frontNatImageUrl &&
        e1?.backNatImageUrl == e2?.backNatImageUrl &&
        e1?.drugTestImageUrl == e2?.drugTestImageUrl &&
        e1?.frontDrivingLicence == e2?.frontDrivingLicence &&
        e1?.backDrivingLicence == e2?.backDrivingLicence &&
        e1?.privileges == e2?.privileges &&
        e1?.shift == e2?.shift &&
        e1?.nationalInformation == e2?.nationalInformation &&
        e1?.drivingInformation == e2?.drivingInformation &&
        e1?.relegion == e2?.relegion &&
        e1?.educationData == e2?.educationData &&
        e1?.isEmployed == e2?.isEmployed &&
        e1?.createdBy == e2?.createdBy &&
        e1?.isDriver == e2?.isDriver &&
        e1?.employmentDate == e2?.employmentDate &&
        e1?.contractorRef == e2?.contractorRef &&
        e1?.leaderAreaRefrence1 == e2?.leaderAreaRefrence1 &&
        e1?.leaderAreaRefrence2 == e2?.leaderAreaRefrence2 &&
        e1?.isAttend == e2?.isAttend &&
        e1?.attendanceState == e2?.attendanceState &&
        e1?.attendance == e2?.attendance &&
        e1?.jobCode == e2?.jobCode;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.firstName,
        e?.middleName,
        e?.lastName,
        e?.gender,
        e?.government,
        e?.city,
        e?.fullAddress,
        e?.socialStatus,
        e?.userCode,
        e?.accountStatus,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.uid,
        e?.birthdate,
        e?.frontNatImageUrl,
        e?.backNatImageUrl,
        e?.drugTestImageUrl,
        e?.frontDrivingLicence,
        e?.backDrivingLicence,
        e?.privileges,
        e?.shift,
        e?.nationalInformation,
        e?.drivingInformation,
        e?.relegion,
        e?.educationData,
        e?.isEmployed,
        e?.createdBy,
        e?.isDriver,
        e?.employmentDate,
        e?.contractorRef,
        e?.leaderAreaRefrence1,
        e?.leaderAreaRefrence2,
        e?.isAttend,
        e?.attendanceState,
        e?.attendance,
        e?.jobCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
