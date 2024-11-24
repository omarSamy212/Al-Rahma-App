// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImageOldPathsStruct extends FFFirebaseStruct {
  ImageOldPathsStruct({
    String? imagePath,
    String? imageID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagePath = imagePath,
        _imageID = imageID,
        super(firestoreUtilData);

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;
  bool hasImagePath() => _imagePath != null;

  // "imageID" field.
  String? _imageID;
  String get imageID => _imageID ?? '';
  set imageID(String? val) => _imageID = val;
  bool hasImageID() => _imageID != null;

  static ImageOldPathsStruct fromMap(Map<String, dynamic> data) =>
      ImageOldPathsStruct(
        imagePath: data['imagePath'] as String?,
        imageID: data['imageID'] as String?,
      );

  static ImageOldPathsStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageOldPathsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imagePath': _imagePath,
        'imageID': _imageID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imagePath': serializeParam(
          _imagePath,
          ParamType.String,
        ),
        'imageID': serializeParam(
          _imageID,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageOldPathsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageOldPathsStruct(
        imagePath: deserializeParam(
          data['imagePath'],
          ParamType.String,
          false,
        ),
        imageID: deserializeParam(
          data['imageID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageOldPathsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageOldPathsStruct &&
        imagePath == other.imagePath &&
        imageID == other.imageID;
  }

  @override
  int get hashCode => const ListEquality().hash([imagePath, imageID]);
}

ImageOldPathsStruct createImageOldPathsStruct({
  String? imagePath,
  String? imageID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageOldPathsStruct(
      imagePath: imagePath,
      imageID: imageID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageOldPathsStruct? updateImageOldPathsStruct(
  ImageOldPathsStruct? imageOldPaths, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageOldPaths
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageOldPathsStructData(
  Map<String, dynamic> firestoreData,
  ImageOldPathsStruct? imageOldPaths,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageOldPaths == null) {
    return;
  }
  if (imageOldPaths.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageOldPaths.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageOldPathsData =
      getImageOldPathsFirestoreData(imageOldPaths, forFieldValue);
  final nestedData =
      imageOldPathsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageOldPaths.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageOldPathsFirestoreData(
  ImageOldPathsStruct? imageOldPaths, [
  bool forFieldValue = false,
]) {
  if (imageOldPaths == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageOldPaths.toMap());

  // Add any Firestore field values
  imageOldPaths.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageOldPathsListFirestoreData(
  List<ImageOldPathsStruct>? imageOldPathss,
) =>
    imageOldPathss
        ?.map((e) => getImageOldPathsFirestoreData(e, true))
        .toList() ??
    [];
