import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class BugReportsRecord extends FirestoreRecord {
  BugReportsRecord._(
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

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "state" field.
  BugState? _state;
  BugState? get state => _state;
  bool hasState() => _state != null;

  // "placeOfIssue" field.
  String? _placeOfIssue;
  String get placeOfIssue => _placeOfIssue ?? '';
  bool hasPlaceOfIssue() => _placeOfIssue != null;

  void _initializeFields() {
    _reportReason = snapshotData['reportReason'] as String?;
    _reportDetails = snapshotData['reportDetails'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _images = getDataList(snapshotData['images']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _state = deserializeEnum<BugState>(snapshotData['state']);
    _placeOfIssue = snapshotData['placeOfIssue'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bugReports');

  static Stream<BugReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BugReportsRecord.fromSnapshot(s));

  static Future<BugReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BugReportsRecord.fromSnapshot(s));

  static BugReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BugReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BugReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BugReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BugReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BugReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBugReportsRecordData({
  String? reportReason,
  String? reportDetails,
  DocumentReference? createdBy,
  DateTime? createdTime,
  BugState? state,
  String? placeOfIssue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportReason': reportReason,
      'reportDetails': reportDetails,
      'created_by': createdBy,
      'createdTime': createdTime,
      'state': state,
      'placeOfIssue': placeOfIssue,
    }.withoutNulls,
  );

  return firestoreData;
}

class BugReportsRecordDocumentEquality implements Equality<BugReportsRecord> {
  const BugReportsRecordDocumentEquality();

  @override
  bool equals(BugReportsRecord? e1, BugReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportReason == e2?.reportReason &&
        e1?.reportDetails == e2?.reportDetails &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.state == e2?.state &&
        e1?.placeOfIssue == e2?.placeOfIssue;
  }

  @override
  int hash(BugReportsRecord? e) => const ListEquality().hash([
        e?.reportReason,
        e?.reportDetails,
        e?.createdBy,
        e?.images,
        e?.createdTime,
        e?.state,
        e?.placeOfIssue
      ]);

  @override
  bool isValidKey(Object? o) => o is BugReportsRecord;
}
