import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "stages" field.
  bool? _stages;
  bool get stages => _stages ?? false;
  bool hasStages() => _stages != null;

  // "reportName" field.
  String? _reportName;
  String get reportName => _reportName ?? '';
  bool hasReportName() => _reportName != null;

  // "reportStages" field.
  List<String>? _reportStages;
  List<String> get reportStages => _reportStages ?? const [];
  bool hasReportStages() => _reportStages != null;

  // "reportViews" field.
  List<String>? _reportViews;
  List<String> get reportViews => _reportViews ?? const [];
  bool hasReportViews() => _reportViews != null;

  void _initializeFields() {
    _stages = snapshotData['stages'] as bool?;
    _reportName = snapshotData['reportName'] as String?;
    _reportStages = getDataList(snapshotData['reportStages']);
    _reportViews = getDataList(snapshotData['reportViews']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  bool? stages,
  String? reportName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stages': stages,
      'reportName': reportName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.stages == e2?.stages &&
        e1?.reportName == e2?.reportName &&
        listEquality.equals(e1?.reportStages, e2?.reportStages) &&
        listEquality.equals(e1?.reportViews, e2?.reportViews);
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality()
      .hash([e?.stages, e?.reportName, e?.reportStages, e?.reportViews]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
