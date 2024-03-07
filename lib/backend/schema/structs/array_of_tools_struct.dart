// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArrayOfToolsStruct extends FFFirebaseStruct {
  ArrayOfToolsStruct({
    DocumentReference? toolId,
    int? quantity,
    String? toolImage,
    int? selectedQuantity,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _toolId = toolId,
        _quantity = quantity,
        _toolImage = toolImage,
        _selectedQuantity = selectedQuantity,
        _name = name,
        super(firestoreUtilData);

  // "toolId" field.
  DocumentReference? _toolId;
  DocumentReference? get toolId => _toolId;
  set toolId(DocumentReference? val) => _toolId = val;
  bool hasToolId() => _toolId != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "toolImage" field.
  String? _toolImage;
  String get toolImage => _toolImage ?? '';
  set toolImage(String? val) => _toolImage = val;
  bool hasToolImage() => _toolImage != null;

  // "selectedQuantity" field.
  int? _selectedQuantity;
  int get selectedQuantity => _selectedQuantity ?? 0;
  set selectedQuantity(int? val) => _selectedQuantity = val;
  void incrementSelectedQuantity(int amount) =>
      _selectedQuantity = selectedQuantity + amount;
  bool hasSelectedQuantity() => _selectedQuantity != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static ArrayOfToolsStruct fromMap(Map<String, dynamic> data) =>
      ArrayOfToolsStruct(
        toolId: data['toolId'] as DocumentReference?,
        quantity: castToType<int>(data['quantity']),
        toolImage: data['toolImage'] as String?,
        selectedQuantity: castToType<int>(data['selectedQuantity']),
        name: data['name'] as String?,
      );

  static ArrayOfToolsStruct? maybeFromMap(dynamic data) => data is Map
      ? ArrayOfToolsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'toolId': _toolId,
        'quantity': _quantity,
        'toolImage': _toolImage,
        'selectedQuantity': _selectedQuantity,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'toolId': serializeParam(
          _toolId,
          ParamType.DocumentReference,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'toolImage': serializeParam(
          _toolImage,
          ParamType.String,
        ),
        'selectedQuantity': serializeParam(
          _selectedQuantity,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ArrayOfToolsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArrayOfToolsStruct(
        toolId: deserializeParam(
          data['toolId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Tools'],
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        toolImage: deserializeParam(
          data['toolImage'],
          ParamType.String,
          false,
        ),
        selectedQuantity: deserializeParam(
          data['selectedQuantity'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ArrayOfToolsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArrayOfToolsStruct &&
        toolId == other.toolId &&
        quantity == other.quantity &&
        toolImage == other.toolImage &&
        selectedQuantity == other.selectedQuantity &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([toolId, quantity, toolImage, selectedQuantity, name]);
}

ArrayOfToolsStruct createArrayOfToolsStruct({
  DocumentReference? toolId,
  int? quantity,
  String? toolImage,
  int? selectedQuantity,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArrayOfToolsStruct(
      toolId: toolId,
      quantity: quantity,
      toolImage: toolImage,
      selectedQuantity: selectedQuantity,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArrayOfToolsStruct? updateArrayOfToolsStruct(
  ArrayOfToolsStruct? arrayOfTools, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    arrayOfTools
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArrayOfToolsStructData(
  Map<String, dynamic> firestoreData,
  ArrayOfToolsStruct? arrayOfTools,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (arrayOfTools == null) {
    return;
  }
  if (arrayOfTools.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && arrayOfTools.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final arrayOfToolsData =
      getArrayOfToolsFirestoreData(arrayOfTools, forFieldValue);
  final nestedData =
      arrayOfToolsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = arrayOfTools.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArrayOfToolsFirestoreData(
  ArrayOfToolsStruct? arrayOfTools, [
  bool forFieldValue = false,
]) {
  if (arrayOfTools == null) {
    return {};
  }
  final firestoreData = mapToFirestore(arrayOfTools.toMap());

  // Add any Firestore field values
  arrayOfTools.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArrayOfToolsListFirestoreData(
  List<ArrayOfToolsStruct>? arrayOfToolss,
) =>
    arrayOfToolss?.map((e) => getArrayOfToolsFirestoreData(e, true)).toList() ??
    [];
