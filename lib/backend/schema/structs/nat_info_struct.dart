// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NatInfoStruct extends FFFirebaseStruct {
  NatInfoStruct({
    int? age,
    String? birthdate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _age = age,
        _birthdate = birthdate,
        super(firestoreUtilData);

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;
  void incrementAge(int amount) => _age = age + amount;
  bool hasAge() => _age != null;

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  set birthdate(String? val) => _birthdate = val;
  bool hasBirthdate() => _birthdate != null;

  static NatInfoStruct fromMap(Map<String, dynamic> data) => NatInfoStruct(
        age: castToType<int>(data['age']),
        birthdate: data['birthdate'] as String?,
      );

  static NatInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? NatInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'age': _age,
        'birthdate': _birthdate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.String,
        ),
      }.withoutNulls;

  static NatInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      NatInfoStruct(
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NatInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NatInfoStruct &&
        age == other.age &&
        birthdate == other.birthdate;
  }

  @override
  int get hashCode => const ListEquality().hash([age, birthdate]);
}

NatInfoStruct createNatInfoStruct({
  int? age,
  String? birthdate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NatInfoStruct(
      age: age,
      birthdate: birthdate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NatInfoStruct? updateNatInfoStruct(
  NatInfoStruct? natInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    natInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNatInfoStructData(
  Map<String, dynamic> firestoreData,
  NatInfoStruct? natInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (natInfo == null) {
    return;
  }
  if (natInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && natInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final natInfoData = getNatInfoFirestoreData(natInfo, forFieldValue);
  final nestedData = natInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = natInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNatInfoFirestoreData(
  NatInfoStruct? natInfo, [
  bool forFieldValue = false,
]) {
  if (natInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(natInfo.toMap());

  // Add any Firestore field values
  natInfo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNatInfoListFirestoreData(
  List<NatInfoStruct>? natInfos,
) =>
    natInfos?.map((e) => getNatInfoFirestoreData(e, true)).toList() ?? [];
