import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleRequestRecord extends FirestoreRecord {
  VehicleRequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reportType" field.
  DocumentReference? _reportType;
  DocumentReference? get reportType => _reportType;
  bool hasReportType() => _reportType != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "requestType" field.
  String? _requestType;
  String get requestType => _requestType ?? '';
  bool hasRequestType() => _requestType != null;

  // "carType" field.
  String? _carType;
  String get carType => _carType ?? '';
  bool hasCarType() => _carType != null;

  // "requestStreet" field.
  DocumentReference? _requestStreet;
  DocumentReference? get requestStreet => _requestStreet;
  bool hasRequestStreet() => _requestStreet != null;

  // "numberOfItems" field.
  int? _numberOfItems;
  int get numberOfItems => _numberOfItems ?? 0;
  bool hasNumberOfItems() => _numberOfItems != null;

  // "requestDescription" field.
  String? _requestDescription;
  String get requestDescription => _requestDescription ?? '';
  bool hasRequestDescription() => _requestDescription != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "reportAcceptanceState" field.
  bool? _reportAcceptanceState;
  bool get reportAcceptanceState => _reportAcceptanceState ?? false;
  bool hasReportAcceptanceState() => _reportAcceptanceState != null;

  // "currentReportStage" field.
  int? _currentReportStage;
  int get currentReportStage => _currentReportStage ?? 0;
  bool hasCurrentReportStage() => _currentReportStage != null;

  // "vehicleRequestComment" field.
  List<String>? _vehicleRequestComment;
  List<String> get vehicleRequestComment => _vehicleRequestComment ?? const [];
  bool hasVehicleRequestComment() => _vehicleRequestComment != null;

  void _initializeFields() {
    _reportType = snapshotData['reportType'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _requestType = snapshotData['requestType'] as String?;
    _carType = snapshotData['carType'] as String?;
    _requestStreet = snapshotData['requestStreet'] as DocumentReference?;
    _numberOfItems = castToType<int>(snapshotData['numberOfItems']);
    _requestDescription = snapshotData['requestDescription'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _reportAcceptanceState = snapshotData['reportAcceptanceState'] as bool?;
    _currentReportStage = castToType<int>(snapshotData['currentReportStage']);
    _vehicleRequestComment = getDataList(snapshotData['vehicleRequestComment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VehicleRequest');

  static Stream<VehicleRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleRequestRecord.fromSnapshot(s));

  static Future<VehicleRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehicleRequestRecord.fromSnapshot(s));

  static VehicleRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleRequestRecordData({
  DocumentReference? reportType,
  DocumentReference? createdBy,
  String? requestType,
  String? carType,
  DocumentReference? requestStreet,
  int? numberOfItems,
  String? requestDescription,
  DateTime? createdTime,
  bool? isCompleted,
  bool? reportAcceptanceState,
  int? currentReportStage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportType': reportType,
      'createdBy': createdBy,
      'requestType': requestType,
      'carType': carType,
      'requestStreet': requestStreet,
      'numberOfItems': numberOfItems,
      'requestDescription': requestDescription,
      'createdTime': createdTime,
      'isCompleted': isCompleted,
      'reportAcceptanceState': reportAcceptanceState,
      'currentReportStage': currentReportStage,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehicleRequestRecordDocumentEquality
    implements Equality<VehicleRequestRecord> {
  const VehicleRequestRecordDocumentEquality();

  @override
  bool equals(VehicleRequestRecord? e1, VehicleRequestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportType == e2?.reportType &&
        e1?.createdBy == e2?.createdBy &&
        e1?.requestType == e2?.requestType &&
        e1?.carType == e2?.carType &&
        e1?.requestStreet == e2?.requestStreet &&
        e1?.numberOfItems == e2?.numberOfItems &&
        e1?.requestDescription == e2?.requestDescription &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.reportAcceptanceState == e2?.reportAcceptanceState &&
        e1?.currentReportStage == e2?.currentReportStage &&
        listEquality.equals(
            e1?.vehicleRequestComment, e2?.vehicleRequestComment);
  }

  @override
  int hash(VehicleRequestRecord? e) => const ListEquality().hash([
        e?.reportType,
        e?.createdBy,
        e?.requestType,
        e?.carType,
        e?.requestStreet,
        e?.numberOfItems,
        e?.requestDescription,
        e?.createdTime,
        e?.isCompleted,
        e?.reportAcceptanceState,
        e?.currentReportStage,
        e?.vehicleRequestComment
      ]);

  @override
  bool isValidKey(Object? o) => o is VehicleRequestRecord;
}
