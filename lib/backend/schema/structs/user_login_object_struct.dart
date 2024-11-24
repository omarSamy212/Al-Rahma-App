// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLoginObjectStruct extends FFFirebaseStruct {
  UserLoginObjectStruct({
    String? message,
    DocumentReference? userRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _userRef = userRef,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  static UserLoginObjectStruct fromMap(Map<String, dynamic> data) =>
      UserLoginObjectStruct(
        message: data['message'] as String?,
        userRef: data['userRef'] as DocumentReference?,
      );

  static UserLoginObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLoginObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'userRef': _userRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserLoginObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserLoginObjectStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'UserLoginObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLoginObjectStruct &&
        message == other.message &&
        userRef == other.userRef;
  }

  @override
  int get hashCode => const ListEquality().hash([message, userRef]);
}

UserLoginObjectStruct createUserLoginObjectStruct({
  String? message,
  DocumentReference? userRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserLoginObjectStruct(
      message: message,
      userRef: userRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserLoginObjectStruct? updateUserLoginObjectStruct(
  UserLoginObjectStruct? userLoginObject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userLoginObject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserLoginObjectStructData(
  Map<String, dynamic> firestoreData,
  UserLoginObjectStruct? userLoginObject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userLoginObject == null) {
    return;
  }
  if (userLoginObject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userLoginObject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userLoginObjectData =
      getUserLoginObjectFirestoreData(userLoginObject, forFieldValue);
  final nestedData =
      userLoginObjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userLoginObject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserLoginObjectFirestoreData(
  UserLoginObjectStruct? userLoginObject, [
  bool forFieldValue = false,
]) {
  if (userLoginObject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userLoginObject.toMap());

  // Add any Firestore field values
  userLoginObject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserLoginObjectListFirestoreData(
  List<UserLoginObjectStruct>? userLoginObjects,
) =>
    userLoginObjects
        ?.map((e) => getUserLoginObjectFirestoreData(e, true))
        .toList() ??
    [];
