import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComplaintsRecord extends FirestoreRecord {
  ComplaintsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reportReason" field.
  String? _reportReason;
  String get reportReason => _reportReason ?? '';
  bool hasReportReason() => _reportReason != null;

  // "reportDetails" field.
  String? _reportDetails;
  String get reportDetails => _reportDetails ?? '';
  bool hasReportDetails() => _reportDetails != null;

  // "reportType" field.
  DocumentReference? _reportType;
  DocumentReference? get reportType => _reportType;
  bool hasReportType() => _reportType != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "userReported" field.
  DocumentReference? _userReported;
  DocumentReference? get userReported => _userReported;
  bool hasUserReported() => _userReported != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "currentReportStage" field.
  int? _currentReportStage;
  int get currentReportStage => _currentReportStage ?? 0;
  bool hasCurrentReportStage() => _currentReportStage != null;

  // "reportAcceptanceState" field.
  bool? _reportAcceptanceState;
  bool get reportAcceptanceState => _reportAcceptanceState ?? false;
  bool hasReportAcceptanceState() => _reportAcceptanceState != null;

  // "complaintComment" field.
  List<String>? _complaintComment;
  List<String> get complaintComment => _complaintComment ?? const [];
  bool hasComplaintComment() => _complaintComment != null;

  // "userReportedSupplier" field.
  DocumentReference? _userReportedSupplier;
  DocumentReference? get userReportedSupplier => _userReportedSupplier;
  bool hasUserReportedSupplier() => _userReportedSupplier != null;

  void _initializeFields() {
    _reportReason = snapshotData['reportReason'] as String?;
    _reportDetails = snapshotData['reportDetails'] as String?;
    _reportType = snapshotData['reportType'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _images = getDataList(snapshotData['images']);
    _userReported = snapshotData['userReported'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _currentReportStage = castToType<int>(snapshotData['currentReportStage']);
    _reportAcceptanceState = snapshotData['reportAcceptanceState'] as bool?;
    _complaintComment = getDataList(snapshotData['complaintComment']);
    _userReportedSupplier =
        snapshotData['userReportedSupplier'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Complaints');

  static Stream<ComplaintsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComplaintsRecord.fromSnapshot(s));

  static Future<ComplaintsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComplaintsRecord.fromSnapshot(s));

  static ComplaintsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComplaintsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComplaintsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComplaintsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComplaintsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComplaintsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComplaintsRecordData({
  String? reportReason,
  String? reportDetails,
  DocumentReference? reportType,
  DocumentReference? createdBy,
  DocumentReference? userReported,
  DateTime? createdTime,
  bool? isCompleted,
  int? currentReportStage,
  bool? reportAcceptanceState,
  DocumentReference? userReportedSupplier,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportReason': reportReason,
      'reportDetails': reportDetails,
      'reportType': reportType,
      'createdBy': createdBy,
      'userReported': userReported,
      'createdTime': createdTime,
      'isCompleted': isCompleted,
      'currentReportStage': currentReportStage,
      'reportAcceptanceState': reportAcceptanceState,
      'userReportedSupplier': userReportedSupplier,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComplaintsRecordDocumentEquality implements Equality<ComplaintsRecord> {
  const ComplaintsRecordDocumentEquality();

  @override
  bool equals(ComplaintsRecord? e1, ComplaintsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportReason == e2?.reportReason &&
        e1?.reportDetails == e2?.reportDetails &&
        e1?.reportType == e2?.reportType &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.userReported == e2?.userReported &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.currentReportStage == e2?.currentReportStage &&
        e1?.reportAcceptanceState == e2?.reportAcceptanceState &&
        listEquality.equals(e1?.complaintComment, e2?.complaintComment) &&
        e1?.userReportedSupplier == e2?.userReportedSupplier;
  }

  @override
  int hash(ComplaintsRecord? e) => const ListEquality().hash([
        e?.reportReason,
        e?.reportDetails,
        e?.reportType,
        e?.createdBy,
        e?.images,
        e?.userReported,
        e?.createdTime,
        e?.isCompleted,
        e?.currentReportStage,
        e?.reportAcceptanceState,
        e?.complaintComment,
        e?.userReportedSupplier
      ]);

  @override
  bool isValidKey(Object? o) => o is ComplaintsRecord;
}
