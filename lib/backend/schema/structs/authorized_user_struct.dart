// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorizedUserStruct extends FFFirebaseStruct {
  AuthorizedUserStruct({
    String? accountStatus,
    String? birthdate,
    String? city,
    String? createdBy,
    DateTime? createdTime,
    String? displayName,
    String? drugTestImageUrl,
    String? backNatImageUrl,
    String? educationData,
    String? email,
    String? employmentDate,
    String? firstName,
    String? frontNatImageUrl,
    String? fullAddress,
    String? gender,
    String? government,
    String? isEmployed,
    bool? isDriver,
    String? lastName,
    DocumentReference? leaderAreaRefrence1,
    DocumentReference? leaderAreaRefrence2,
    String? middleName,
    NationalInformationStruct? nationalInformation,
    String? photoUrl,
    UserPrivilegesStruct? privileges,
    ShiftStruct? shift,
    String? socialStatus,
    String? uid,
    String? userCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accountStatus = accountStatus,
        _birthdate = birthdate,
        _city = city,
        _createdBy = createdBy,
        _createdTime = createdTime,
        _displayName = displayName,
        _drugTestImageUrl = drugTestImageUrl,
        _backNatImageUrl = backNatImageUrl,
        _educationData = educationData,
        _email = email,
        _employmentDate = employmentDate,
        _firstName = firstName,
        _frontNatImageUrl = frontNatImageUrl,
        _fullAddress = fullAddress,
        _gender = gender,
        _government = government,
        _isEmployed = isEmployed,
        _isDriver = isDriver,
        _lastName = lastName,
        _leaderAreaRefrence1 = leaderAreaRefrence1,
        _leaderAreaRefrence2 = leaderAreaRefrence2,
        _middleName = middleName,
        _nationalInformation = nationalInformation,
        _photoUrl = photoUrl,
        _privileges = privileges,
        _shift = shift,
        _socialStatus = socialStatus,
        _uid = uid,
        _userCode = userCode,
        super(firestoreUtilData);

  // "accountStatus" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  set accountStatus(String? val) => _accountStatus = val;
  bool hasAccountStatus() => _accountStatus != null;

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  set birthdate(String? val) => _birthdate = val;
  bool hasBirthdate() => _birthdate != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;
  bool hasCreatedBy() => _createdBy != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "drug_test_image_url" field.
  String? _drugTestImageUrl;
  String get drugTestImageUrl => _drugTestImageUrl ?? '';
  set drugTestImageUrl(String? val) => _drugTestImageUrl = val;
  bool hasDrugTestImageUrl() => _drugTestImageUrl != null;

  // "back_nat_image_url" field.
  String? _backNatImageUrl;
  String get backNatImageUrl => _backNatImageUrl ?? '';
  set backNatImageUrl(String? val) => _backNatImageUrl = val;
  bool hasBackNatImageUrl() => _backNatImageUrl != null;

  // "educationData" field.
  String? _educationData;
  String get educationData => _educationData ?? '';
  set educationData(String? val) => _educationData = val;
  bool hasEducationData() => _educationData != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "employmentDate" field.
  String? _employmentDate;
  String get employmentDate => _employmentDate ?? '';
  set employmentDate(String? val) => _employmentDate = val;
  bool hasEmploymentDate() => _employmentDate != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "front_nat_image_url" field.
  String? _frontNatImageUrl;
  String get frontNatImageUrl => _frontNatImageUrl ?? '';
  set frontNatImageUrl(String? val) => _frontNatImageUrl = val;
  bool hasFrontNatImageUrl() => _frontNatImageUrl != null;

  // "fullAddress" field.
  String? _fullAddress;
  String get fullAddress => _fullAddress ?? '';
  set fullAddress(String? val) => _fullAddress = val;
  bool hasFullAddress() => _fullAddress != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "government" field.
  String? _government;
  String get government => _government ?? '';
  set government(String? val) => _government = val;
  bool hasGovernment() => _government != null;

  // "isEmployed" field.
  String? _isEmployed;
  String get isEmployed => _isEmployed ?? '';
  set isEmployed(String? val) => _isEmployed = val;
  bool hasIsEmployed() => _isEmployed != null;

  // "is_driver" field.
  bool? _isDriver;
  bool get isDriver => _isDriver ?? false;
  set isDriver(bool? val) => _isDriver = val;
  bool hasIsDriver() => _isDriver != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "leaderAreaRefrence1" field.
  DocumentReference? _leaderAreaRefrence1;
  DocumentReference? get leaderAreaRefrence1 => _leaderAreaRefrence1;
  set leaderAreaRefrence1(DocumentReference? val) => _leaderAreaRefrence1 = val;
  bool hasLeaderAreaRefrence1() => _leaderAreaRefrence1 != null;

  // "leaderAreaRefrence2" field.
  DocumentReference? _leaderAreaRefrence2;
  DocumentReference? get leaderAreaRefrence2 => _leaderAreaRefrence2;
  set leaderAreaRefrence2(DocumentReference? val) => _leaderAreaRefrence2 = val;
  bool hasLeaderAreaRefrence2() => _leaderAreaRefrence2 != null;

  // "middleName" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  set middleName(String? val) => _middleName = val;
  bool hasMiddleName() => _middleName != null;

  // "national_information" field.
  NationalInformationStruct? _nationalInformation;
  NationalInformationStruct get nationalInformation =>
      _nationalInformation ?? NationalInformationStruct();
  set nationalInformation(NationalInformationStruct? val) =>
      _nationalInformation = val;
  void updateNationalInformation(
          Function(NationalInformationStruct) updateFn) =>
      updateFn(_nationalInformation ??= NationalInformationStruct());
  bool hasNationalInformation() => _nationalInformation != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;
  bool hasPhotoUrl() => _photoUrl != null;

  // "privileges" field.
  UserPrivilegesStruct? _privileges;
  UserPrivilegesStruct get privileges => _privileges ?? UserPrivilegesStruct();
  set privileges(UserPrivilegesStruct? val) => _privileges = val;
  void updatePrivileges(Function(UserPrivilegesStruct) updateFn) =>
      updateFn(_privileges ??= UserPrivilegesStruct());
  bool hasPrivileges() => _privileges != null;

  // "shift" field.
  ShiftStruct? _shift;
  ShiftStruct get shift => _shift ?? ShiftStruct();
  set shift(ShiftStruct? val) => _shift = val;
  void updateShift(Function(ShiftStruct) updateFn) =>
      updateFn(_shift ??= ShiftStruct());
  bool hasShift() => _shift != null;

  // "socialStatus" field.
  String? _socialStatus;
  String get socialStatus => _socialStatus ?? '';
  set socialStatus(String? val) => _socialStatus = val;
  bool hasSocialStatus() => _socialStatus != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "userCode" field.
  String? _userCode;
  String get userCode => _userCode ?? '';
  set userCode(String? val) => _userCode = val;
  bool hasUserCode() => _userCode != null;

  static AuthorizedUserStruct fromMap(Map<String, dynamic> data) =>
      AuthorizedUserStruct(
        accountStatus: data['accountStatus'] as String?,
        birthdate: data['birthdate'] as String?,
        city: data['city'] as String?,
        createdBy: data['created_by'] as String?,
        createdTime: data['created_time'] as DateTime?,
        displayName: data['display_name'] as String?,
        drugTestImageUrl: data['drug_test_image_url'] as String?,
        backNatImageUrl: data['back_nat_image_url'] as String?,
        educationData: data['educationData'] as String?,
        email: data['email'] as String?,
        employmentDate: data['employmentDate'] as String?,
        firstName: data['firstName'] as String?,
        frontNatImageUrl: data['front_nat_image_url'] as String?,
        fullAddress: data['fullAddress'] as String?,
        gender: data['gender'] as String?,
        government: data['government'] as String?,
        isEmployed: data['isEmployed'] as String?,
        isDriver: data['is_driver'] as bool?,
        lastName: data['lastName'] as String?,
        leaderAreaRefrence1: data['leaderAreaRefrence1'] as DocumentReference?,
        leaderAreaRefrence2: data['leaderAreaRefrence2'] as DocumentReference?,
        middleName: data['middleName'] as String?,
        nationalInformation: NationalInformationStruct.maybeFromMap(
            data['national_information']),
        photoUrl: data['photo_url'] as String?,
        privileges: UserPrivilegesStruct.maybeFromMap(data['privileges']),
        shift: ShiftStruct.maybeFromMap(data['shift']),
        socialStatus: data['socialStatus'] as String?,
        uid: data['uid'] as String?,
        userCode: data['userCode'] as String?,
      );

  static AuthorizedUserStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthorizedUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'accountStatus': _accountStatus,
        'birthdate': _birthdate,
        'city': _city,
        'created_by': _createdBy,
        'created_time': _createdTime,
        'display_name': _displayName,
        'drug_test_image_url': _drugTestImageUrl,
        'back_nat_image_url': _backNatImageUrl,
        'educationData': _educationData,
        'email': _email,
        'employmentDate': _employmentDate,
        'firstName': _firstName,
        'front_nat_image_url': _frontNatImageUrl,
        'fullAddress': _fullAddress,
        'gender': _gender,
        'government': _government,
        'isEmployed': _isEmployed,
        'is_driver': _isDriver,
        'lastName': _lastName,
        'leaderAreaRefrence1': _leaderAreaRefrence1,
        'leaderAreaRefrence2': _leaderAreaRefrence2,
        'middleName': _middleName,
        'national_information': _nationalInformation?.toMap(),
        'photo_url': _photoUrl,
        'privileges': _privileges?.toMap(),
        'shift': _shift?.toMap(),
        'socialStatus': _socialStatus,
        'uid': _uid,
        'userCode': _userCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'accountStatus': serializeParam(
          _accountStatus,
          ParamType.String,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'drug_test_image_url': serializeParam(
          _drugTestImageUrl,
          ParamType.String,
        ),
        'back_nat_image_url': serializeParam(
          _backNatImageUrl,
          ParamType.String,
        ),
        'educationData': serializeParam(
          _educationData,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'employmentDate': serializeParam(
          _employmentDate,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'front_nat_image_url': serializeParam(
          _frontNatImageUrl,
          ParamType.String,
        ),
        'fullAddress': serializeParam(
          _fullAddress,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'government': serializeParam(
          _government,
          ParamType.String,
        ),
        'isEmployed': serializeParam(
          _isEmployed,
          ParamType.String,
        ),
        'is_driver': serializeParam(
          _isDriver,
          ParamType.bool,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'leaderAreaRefrence1': serializeParam(
          _leaderAreaRefrence1,
          ParamType.DocumentReference,
        ),
        'leaderAreaRefrence2': serializeParam(
          _leaderAreaRefrence2,
          ParamType.DocumentReference,
        ),
        'middleName': serializeParam(
          _middleName,
          ParamType.String,
        ),
        'national_information': serializeParam(
          _nationalInformation,
          ParamType.DataStruct,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'privileges': serializeParam(
          _privileges,
          ParamType.DataStruct,
        ),
        'shift': serializeParam(
          _shift,
          ParamType.DataStruct,
        ),
        'socialStatus': serializeParam(
          _socialStatus,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'userCode': serializeParam(
          _userCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthorizedUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthorizedUserStruct(
        accountStatus: deserializeParam(
          data['accountStatus'],
          ParamType.String,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        drugTestImageUrl: deserializeParam(
          data['drug_test_image_url'],
          ParamType.String,
          false,
        ),
        backNatImageUrl: deserializeParam(
          data['back_nat_image_url'],
          ParamType.String,
          false,
        ),
        educationData: deserializeParam(
          data['educationData'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        employmentDate: deserializeParam(
          data['employmentDate'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        frontNatImageUrl: deserializeParam(
          data['front_nat_image_url'],
          ParamType.String,
          false,
        ),
        fullAddress: deserializeParam(
          data['fullAddress'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        government: deserializeParam(
          data['government'],
          ParamType.String,
          false,
        ),
        isEmployed: deserializeParam(
          data['isEmployed'],
          ParamType.String,
          false,
        ),
        isDriver: deserializeParam(
          data['is_driver'],
          ParamType.bool,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        leaderAreaRefrence1: deserializeParam(
          data['leaderAreaRefrence1'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Leaders'],
        ),
        leaderAreaRefrence2: deserializeParam(
          data['leaderAreaRefrence2'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Leaders'],
        ),
        middleName: deserializeParam(
          data['middleName'],
          ParamType.String,
          false,
        ),
        nationalInformation: deserializeStructParam(
          data['national_information'],
          ParamType.DataStruct,
          false,
          structBuilder: NationalInformationStruct.fromSerializableMap,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        privileges: deserializeStructParam(
          data['privileges'],
          ParamType.DataStruct,
          false,
          structBuilder: UserPrivilegesStruct.fromSerializableMap,
        ),
        shift: deserializeStructParam(
          data['shift'],
          ParamType.DataStruct,
          false,
          structBuilder: ShiftStruct.fromSerializableMap,
        ),
        socialStatus: deserializeParam(
          data['socialStatus'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        userCode: deserializeParam(
          data['userCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthorizedUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthorizedUserStruct &&
        accountStatus == other.accountStatus &&
        birthdate == other.birthdate &&
        city == other.city &&
        createdBy == other.createdBy &&
        createdTime == other.createdTime &&
        displayName == other.displayName &&
        drugTestImageUrl == other.drugTestImageUrl &&
        backNatImageUrl == other.backNatImageUrl &&
        educationData == other.educationData &&
        email == other.email &&
        employmentDate == other.employmentDate &&
        firstName == other.firstName &&
        frontNatImageUrl == other.frontNatImageUrl &&
        fullAddress == other.fullAddress &&
        gender == other.gender &&
        government == other.government &&
        isEmployed == other.isEmployed &&
        isDriver == other.isDriver &&
        lastName == other.lastName &&
        leaderAreaRefrence1 == other.leaderAreaRefrence1 &&
        leaderAreaRefrence2 == other.leaderAreaRefrence2 &&
        middleName == other.middleName &&
        nationalInformation == other.nationalInformation &&
        photoUrl == other.photoUrl &&
        privileges == other.privileges &&
        shift == other.shift &&
        socialStatus == other.socialStatus &&
        uid == other.uid &&
        userCode == other.userCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        accountStatus,
        birthdate,
        city,
        createdBy,
        createdTime,
        displayName,
        drugTestImageUrl,
        backNatImageUrl,
        educationData,
        email,
        employmentDate,
        firstName,
        frontNatImageUrl,
        fullAddress,
        gender,
        government,
        isEmployed,
        isDriver,
        lastName,
        leaderAreaRefrence1,
        leaderAreaRefrence2,
        middleName,
        nationalInformation,
        photoUrl,
        privileges,
        shift,
        socialStatus,
        uid,
        userCode
      ]);
}

AuthorizedUserStruct createAuthorizedUserStruct({
  String? accountStatus,
  String? birthdate,
  String? city,
  String? createdBy,
  DateTime? createdTime,
  String? displayName,
  String? drugTestImageUrl,
  String? backNatImageUrl,
  String? educationData,
  String? email,
  String? employmentDate,
  String? firstName,
  String? frontNatImageUrl,
  String? fullAddress,
  String? gender,
  String? government,
  String? isEmployed,
  bool? isDriver,
  String? lastName,
  DocumentReference? leaderAreaRefrence1,
  DocumentReference? leaderAreaRefrence2,
  String? middleName,
  NationalInformationStruct? nationalInformation,
  String? photoUrl,
  UserPrivilegesStruct? privileges,
  ShiftStruct? shift,
  String? socialStatus,
  String? uid,
  String? userCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthorizedUserStruct(
      accountStatus: accountStatus,
      birthdate: birthdate,
      city: city,
      createdBy: createdBy,
      createdTime: createdTime,
      displayName: displayName,
      drugTestImageUrl: drugTestImageUrl,
      backNatImageUrl: backNatImageUrl,
      educationData: educationData,
      email: email,
      employmentDate: employmentDate,
      firstName: firstName,
      frontNatImageUrl: frontNatImageUrl,
      fullAddress: fullAddress,
      gender: gender,
      government: government,
      isEmployed: isEmployed,
      isDriver: isDriver,
      lastName: lastName,
      leaderAreaRefrence1: leaderAreaRefrence1,
      leaderAreaRefrence2: leaderAreaRefrence2,
      middleName: middleName,
      nationalInformation: nationalInformation ??
          (clearUnsetFields ? NationalInformationStruct() : null),
      photoUrl: photoUrl,
      privileges:
          privileges ?? (clearUnsetFields ? UserPrivilegesStruct() : null),
      shift: shift ?? (clearUnsetFields ? ShiftStruct() : null),
      socialStatus: socialStatus,
      uid: uid,
      userCode: userCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthorizedUserStruct? updateAuthorizedUserStruct(
  AuthorizedUserStruct? authorizedUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authorizedUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthorizedUserStructData(
  Map<String, dynamic> firestoreData,
  AuthorizedUserStruct? authorizedUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authorizedUser == null) {
    return;
  }
  if (authorizedUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && authorizedUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authorizedUserData =
      getAuthorizedUserFirestoreData(authorizedUser, forFieldValue);
  final nestedData =
      authorizedUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = authorizedUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthorizedUserFirestoreData(
  AuthorizedUserStruct? authorizedUser, [
  bool forFieldValue = false,
]) {
  if (authorizedUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authorizedUser.toMap());

  // Handle nested data for "national_information" field.
  addNationalInformationStructData(
    firestoreData,
    authorizedUser.hasNationalInformation()
        ? authorizedUser.nationalInformation
        : null,
    'national_information',
    forFieldValue,
  );

  // Handle nested data for "privileges" field.
  addUserPrivilegesStructData(
    firestoreData,
    authorizedUser.hasPrivileges() ? authorizedUser.privileges : null,
    'privileges',
    forFieldValue,
  );

  // Handle nested data for "shift" field.
  addShiftStructData(
    firestoreData,
    authorizedUser.hasShift() ? authorizedUser.shift : null,
    'shift',
    forFieldValue,
  );

  // Add any Firestore field values
  authorizedUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthorizedUserListFirestoreData(
  List<AuthorizedUserStruct>? authorizedUsers,
) =>
    authorizedUsers
        ?.map((e) => getAuthorizedUserFirestoreData(e, true))
        .toList() ??
    [];
