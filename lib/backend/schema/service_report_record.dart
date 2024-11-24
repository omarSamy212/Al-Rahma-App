import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceReportRecord extends FirestoreRecord {
  ServiceReportRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "carType" field.
  String? _carType;
  String get carType => _carType ?? '';
  bool hasCarType() => _carType != null;

  // "userReported" field.
  DocumentReference? _userReported;
  DocumentReference? get userReported => _userReported;
  bool hasUserReported() => _userReported != null;

  // "carLicense" field.
  String? _carLicense;
  String get carLicense => _carLicense ?? '';
  bool hasCarLicense() => _carLicense != null;

  // "totalPrice" field.
  int? _totalPrice;
  int get totalPrice => _totalPrice ?? 0;
  bool hasTotalPrice() => _totalPrice != null;

  // "reportDescription" field.
  String? _reportDescription;
  String get reportDescription => _reportDescription ?? '';
  bool hasReportDescription() => _reportDescription != null;

  void _initializeFields() {
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _carType = snapshotData['carType'] as String?;
    _userReported = snapshotData['userReported'] as DocumentReference?;
    _carLicense = snapshotData['carLicense'] as String?;
    _totalPrice = castToType<int>(snapshotData['totalPrice']);
    _reportDescription = snapshotData['reportDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ServiceReport');

  static Stream<ServiceReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceReportRecord.fromSnapshot(s));

  static Future<ServiceReportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceReportRecord.fromSnapshot(s));

  static ServiceReportRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceReportRecordData({
  DocumentReference? createdBy,
  DateTime? createdTime,
  String? carType,
  DocumentReference? userReported,
  String? carLicense,
  int? totalPrice,
  String? reportDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdBy': createdBy,
      'createdTime': createdTime,
      'carType': carType,
      'userReported': userReported,
      'carLicense': carLicense,
      'totalPrice': totalPrice,
      'reportDescription': reportDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceReportRecordDocumentEquality
    implements Equality<ServiceReportRecord> {
  const ServiceReportRecordDocumentEquality();

  @override
  bool equals(ServiceReportRecord? e1, ServiceReportRecord? e2) {
    return e1?.createdBy == e2?.createdBy &&
        e1?.createdTime == e2?.createdTime &&
        e1?.carType == e2?.carType &&
        e1?.userReported == e2?.userReported &&
        e1?.carLicense == e2?.carLicense &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.reportDescription == e2?.reportDescription;
  }

  @override
  int hash(ServiceReportRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.createdTime,
        e?.carType,
        e?.userReported,
        e?.carLicense,
        e?.totalPrice,
        e?.reportDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceReportRecord;
}
