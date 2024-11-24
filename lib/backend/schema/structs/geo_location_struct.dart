// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeoLocationStruct extends FFFirebaseStruct {
  GeoLocationStruct({
    double? longitude,
    double? latitude,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _longitude = longitude,
        _latitude = latitude,
        super(firestoreUtilData);

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  static GeoLocationStruct fromMap(Map<String, dynamic> data) =>
      GeoLocationStruct(
        longitude: castToType<double>(data['longitude']),
        latitude: castToType<double>(data['latitude']),
      );

  static GeoLocationStruct? maybeFromMap(dynamic data) => data is Map
      ? GeoLocationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'longitude': _longitude,
        'latitude': _latitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static GeoLocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeoLocationStruct(
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GeoLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeoLocationStruct &&
        longitude == other.longitude &&
        latitude == other.latitude;
  }

  @override
  int get hashCode => const ListEquality().hash([longitude, latitude]);
}

GeoLocationStruct createGeoLocationStruct({
  double? longitude,
  double? latitude,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeoLocationStruct(
      longitude: longitude,
      latitude: latitude,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeoLocationStruct? updateGeoLocationStruct(
  GeoLocationStruct? geoLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    geoLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeoLocationStructData(
  Map<String, dynamic> firestoreData,
  GeoLocationStruct? geoLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (geoLocation == null) {
    return;
  }
  if (geoLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && geoLocation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final geoLocationData =
      getGeoLocationFirestoreData(geoLocation, forFieldValue);
  final nestedData =
      geoLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = geoLocation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeoLocationFirestoreData(
  GeoLocationStruct? geoLocation, [
  bool forFieldValue = false,
]) {
  if (geoLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(geoLocation.toMap());

  // Add any Firestore field values
  geoLocation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeoLocationListFirestoreData(
  List<GeoLocationStruct>? geoLocations,
) =>
    geoLocations?.map((e) => getGeoLocationFirestoreData(e, true)).toList() ??
    [];
