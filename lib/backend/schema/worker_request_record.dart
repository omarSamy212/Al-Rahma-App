import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkerRequestRecord extends FirestoreRecord {
  WorkerRequestRecord._(
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

  // "requestStreet" field.
  DocumentReference? _requestStreet;
  DocumentReference? get requestStreet => _requestStreet;
  bool hasRequestStreet() => _requestStreet != null;

  // "numberOfitems" field.
  int? _numberOfitems;
  int get numberOfitems => _numberOfitems ?? 0;
  bool hasNumberOfitems() => _numberOfitems != null;

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

  // "workerRequestComment" field.
  List<String>? _workerRequestComment;
  List<String> get workerRequestComment => _workerRequestComment ?? const [];
  bool hasWorkerRequestComment() => _workerRequestComment != null;

  void _initializeFields() {
    _reportType = snapshotData['reportType'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _requestType = snapshotData['requestType'] as String?;
    _requestStreet = snapshotData['requestStreet'] as DocumentReference?;
    _numberOfitems = castToType<int>(snapshotData['numberOfitems']);
    _requestDescription = snapshotData['requestDescription'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _reportAcceptanceState = snapshotData['reportAcceptanceState'] as bool?;
    _currentReportStage = castToType<int>(snapshotData['currentReportStage']);
    _workerRequestComment = getDataList(snapshotData['workerRequestComment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WorkerRequest');

  static Stream<WorkerRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerRequestRecord.fromSnapshot(s));

  static Future<WorkerRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerRequestRecord.fromSnapshot(s));

  static WorkerRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkerRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerRequestRecordData({
  DocumentReference? reportType,
  DocumentReference? createdBy,
  String? requestType,
  DocumentReference? requestStreet,
  int? numberOfitems,
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
      'requestStreet': requestStreet,
      'numberOfitems': numberOfitems,
      'requestDescription': requestDescription,
      'createdTime': createdTime,
      'isCompleted': isCompleted,
      'reportAcceptanceState': reportAcceptanceState,
      'currentReportStage': currentReportStage,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerRequestRecordDocumentEquality
    implements Equality<WorkerRequestRecord> {
  const WorkerRequestRecordDocumentEquality();

  @override
  bool equals(WorkerRequestRecord? e1, WorkerRequestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportType == e2?.reportType &&
        e1?.createdBy == e2?.createdBy &&
        e1?.requestType == e2?.requestType &&
        e1?.requestStreet == e2?.requestStreet &&
        e1?.numberOfitems == e2?.numberOfitems &&
        e1?.requestDescription == e2?.requestDescription &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.reportAcceptanceState == e2?.reportAcceptanceState &&
        e1?.currentReportStage == e2?.currentReportStage &&
        listEquality.equals(e1?.workerRequestComment, e2?.workerRequestComment);
  }

  @override
  int hash(WorkerRequestRecord? e) => const ListEquality().hash([
        e?.reportType,
        e?.createdBy,
        e?.requestType,
        e?.requestStreet,
        e?.numberOfitems,
        e?.requestDescription,
        e?.createdTime,
        e?.isCompleted,
        e?.reportAcceptanceState,
        e?.currentReportStage,
        e?.workerRequestComment
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerRequestRecord;
}
