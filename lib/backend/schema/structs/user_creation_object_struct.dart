// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCreationObjectStruct extends FFFirebaseStruct {
  UserCreationObjectStruct({
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

  static UserCreationObjectStruct fromMap(Map<String, dynamic> data) =>
      UserCreationObjectStruct(
        message: data['message'] as String?,
        userRef: data['userRef'] as DocumentReference?,
      );

  static UserCreationObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCreationObjectStruct.fromMap(data.cast<String, dynamic>())
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

  static UserCreationObjectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserCreationObjectStruct(
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
  String toString() => 'UserCreationObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCreationObjectStruct &&
        message == other.message &&
        userRef == other.userRef;
  }

  @override
  int get hashCode => const ListEquality().hash([message, userRef]);
}

UserCreationObjectStruct createUserCreationObjectStruct({
  String? message,
  DocumentReference? userRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCreationObjectStruct(
      message: message,
      userRef: userRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCreationObjectStruct? updateUserCreationObjectStruct(
  UserCreationObjectStruct? userCreationObject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCreationObject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCreationObjectStructData(
  Map<String, dynamic> firestoreData,
  UserCreationObjectStruct? userCreationObject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCreationObject == null) {
    return;
  }
  if (userCreationObject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCreationObject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCreationObjectData =
      getUserCreationObjectFirestoreData(userCreationObject, forFieldValue);
  final nestedData =
      userCreationObjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userCreationObject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCreationObjectFirestoreData(
  UserCreationObjectStruct? userCreationObject, [
  bool forFieldValue = false,
]) {
  if (userCreationObject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCreationObject.toMap());

  // Add any Firestore field values
  userCreationObject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCreationObjectListFirestoreData(
  List<UserCreationObjectStruct>? userCreationObjects,
) =>
    userCreationObjects
        ?.map((e) => getUserCreationObjectFirestoreData(e, true))
        .toList() ??
    [];
