// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPrivilegesStruct extends FFFirebaseStruct {
  UserPrivilegesStruct({
    String? roleName,
    List<DocumentReference>? roleTasks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _roleName = roleName,
        _roleTasks = roleTasks,
        super(firestoreUtilData);

  // "role_name" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  set roleName(String? val) => _roleName = val;
  bool hasRoleName() => _roleName != null;

  // "role_tasks" field.
  List<DocumentReference>? _roleTasks;
  List<DocumentReference> get roleTasks => _roleTasks ?? const [];
  set roleTasks(List<DocumentReference>? val) => _roleTasks = val;
  void updateRoleTasks(Function(List<DocumentReference>) updateFn) =>
      updateFn(_roleTasks ??= []);
  bool hasRoleTasks() => _roleTasks != null;

  static UserPrivilegesStruct fromMap(Map<String, dynamic> data) =>
      UserPrivilegesStruct(
        roleName: data['role_name'] as String?,
        roleTasks: getDataList(data['role_tasks']),
      );

  static UserPrivilegesStruct? maybeFromMap(dynamic data) => data is Map
      ? UserPrivilegesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role_name': _roleName,
        'role_tasks': _roleTasks,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role_name': serializeParam(
          _roleName,
          ParamType.String,
        ),
        'role_tasks': serializeParam(
          _roleTasks,
          ParamType.DocumentReference,
          true,
        ),
      }.withoutNulls;

  static UserPrivilegesStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserPrivilegesStruct(
        roleName: deserializeParam(
          data['role_name'],
          ParamType.String,
          false,
        ),
        roleTasks: deserializeParam<DocumentReference>(
          data['role_tasks'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['tasks'],
        ),
      );

  @override
  String toString() => 'UserPrivilegesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserPrivilegesStruct &&
        roleName == other.roleName &&
        listEquality.equals(roleTasks, other.roleTasks);
  }

  @override
  int get hashCode => const ListEquality().hash([roleName, roleTasks]);
}

UserPrivilegesStruct createUserPrivilegesStruct({
  String? roleName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserPrivilegesStruct(
      roleName: roleName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserPrivilegesStruct? updateUserPrivilegesStruct(
  UserPrivilegesStruct? userPrivileges, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userPrivileges
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserPrivilegesStructData(
  Map<String, dynamic> firestoreData,
  UserPrivilegesStruct? userPrivileges,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userPrivileges == null) {
    return;
  }
  if (userPrivileges.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userPrivileges.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPrivilegesData =
      getUserPrivilegesFirestoreData(userPrivileges, forFieldValue);
  final nestedData =
      userPrivilegesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userPrivileges.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserPrivilegesFirestoreData(
  UserPrivilegesStruct? userPrivileges, [
  bool forFieldValue = false,
]) {
  if (userPrivileges == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userPrivileges.toMap());

  // Add any Firestore field values
  userPrivileges.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPrivilegesListFirestoreData(
  List<UserPrivilegesStruct>? userPrivilegess,
) =>
    userPrivilegess
        ?.map((e) => getUserPrivilegesFirestoreData(e, true))
        .toList() ??
    [];
