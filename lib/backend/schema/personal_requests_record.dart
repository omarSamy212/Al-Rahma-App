import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalRequestsRecord extends FirestoreRecord {
  PersonalRequestsRecord._(
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

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

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

  // "reportType" field.
  DocumentReference? _reportType;
  DocumentReference? get reportType => _reportType;
  bool hasReportType() => _reportType != null;

  // "userRespons" field.
  List<PersonalRequestUserResponsStruct>? _userRespons;
  List<PersonalRequestUserResponsStruct> get userRespons =>
      _userRespons ?? const [];
  bool hasUserRespons() => _userRespons != null;

  void _initializeFields() {
    _reportReason = snapshotData['reportReason'] as String?;
    _reportDetails = snapshotData['reportDetails'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _currentReportStage = castToType<int>(snapshotData['currentReportStage']);
    _reportAcceptanceState = snapshotData['reportAcceptanceState'] as bool?;
    _reportType = snapshotData['reportType'] as DocumentReference?;
    _userRespons = getStructList(
      snapshotData['userRespons'],
      PersonalRequestUserResponsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PersonalRequests');

  static Stream<PersonalRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalRequestsRecord.fromSnapshot(s));

  static Future<PersonalRequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PersonalRequestsRecord.fromSnapshot(s));

  static PersonalRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalRequestsRecordData({
  String? reportReason,
  String? reportDetails,
  DocumentReference? createdBy,
  DateTime? createdTime,
  bool? isCompleted,
  int? currentReportStage,
  bool? reportAcceptanceState,
  DocumentReference? reportType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportReason': reportReason,
      'reportDetails': reportDetails,
      'createdBy': createdBy,
      'createdTime': createdTime,
      'isCompleted': isCompleted,
      'currentReportStage': currentReportStage,
      'reportAcceptanceState': reportAcceptanceState,
      'reportType': reportType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalRequestsRecordDocumentEquality
    implements Equality<PersonalRequestsRecord> {
  const PersonalRequestsRecordDocumentEquality();

  @override
  bool equals(PersonalRequestsRecord? e1, PersonalRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportReason == e2?.reportReason &&
        e1?.reportDetails == e2?.reportDetails &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.currentReportStage == e2?.currentReportStage &&
        e1?.reportAcceptanceState == e2?.reportAcceptanceState &&
        e1?.reportType == e2?.reportType &&
        listEquality.equals(e1?.userRespons, e2?.userRespons);
  }

  @override
  int hash(PersonalRequestsRecord? e) => const ListEquality().hash([
        e?.reportReason,
        e?.reportDetails,
        e?.createdBy,
        e?.createdTime,
        e?.isCompleted,
        e?.currentReportStage,
        e?.reportAcceptanceState,
        e?.reportType,
        e?.userRespons
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalRequestsRecord;
}
