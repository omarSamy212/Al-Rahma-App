// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PersonalRequestUserResponsStruct extends FFFirebaseStruct {
  PersonalRequestUserResponsStruct({
    String? userRole,
    String? response,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRole = userRole,
        _response = response,
        super(firestoreUtilData);

  // "userRole" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;
  bool hasUserRole() => _userRole != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  set response(String? val) => _response = val;
  bool hasResponse() => _response != null;

  static PersonalRequestUserResponsStruct fromMap(Map<String, dynamic> data) =>
      PersonalRequestUserResponsStruct(
        userRole: data['userRole'] as String?,
        response: data['response'] as String?,
      );

  static PersonalRequestUserResponsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? PersonalRequestUserResponsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userRole': _userRole,
        'response': _response,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userRole': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
      }.withoutNulls;

  static PersonalRequestUserResponsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PersonalRequestUserResponsStruct(
        userRole: deserializeParam(
          data['userRole'],
          ParamType.String,
          false,
        ),
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PersonalRequestUserResponsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonalRequestUserResponsStruct &&
        userRole == other.userRole &&
        response == other.response;
  }

  @override
  int get hashCode => const ListEquality().hash([userRole, response]);
}

PersonalRequestUserResponsStruct createPersonalRequestUserResponsStruct({
  String? userRole,
  String? response,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonalRequestUserResponsStruct(
      userRole: userRole,
      response: response,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonalRequestUserResponsStruct? updatePersonalRequestUserResponsStruct(
  PersonalRequestUserResponsStruct? personalRequestUserRespons, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    personalRequestUserRespons
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonalRequestUserResponsStructData(
  Map<String, dynamic> firestoreData,
  PersonalRequestUserResponsStruct? personalRequestUserRespons,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (personalRequestUserRespons == null) {
    return;
  }
  if (personalRequestUserRespons.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      personalRequestUserRespons.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personalRequestUserResponsData =
      getPersonalRequestUserResponsFirestoreData(
          personalRequestUserRespons, forFieldValue);
  final nestedData = personalRequestUserResponsData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      personalRequestUserRespons.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonalRequestUserResponsFirestoreData(
  PersonalRequestUserResponsStruct? personalRequestUserRespons, [
  bool forFieldValue = false,
]) {
  if (personalRequestUserRespons == null) {
    return {};
  }
  final firestoreData = mapToFirestore(personalRequestUserRespons.toMap());

  // Add any Firestore field values
  personalRequestUserRespons.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonalRequestUserResponsListFirestoreData(
  List<PersonalRequestUserResponsStruct>? personalRequestUserResponss,
) =>
    personalRequestUserResponss
        ?.map((e) => getPersonalRequestUserResponsFirestoreData(e, true))
        .toList() ??
    [];
