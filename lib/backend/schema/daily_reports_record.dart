import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DailyReportsRecord extends FirestoreRecord {
  DailyReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sweepCondition" field.
  String? _sweepCondition;
  String get sweepCondition => _sweepCondition ?? '';
  bool hasSweepCondition() => _sweepCondition != null;

  // "dustStrippingCondition" field.
  String? _dustStrippingCondition;
  String get dustStrippingCondition => _dustStrippingCondition ?? '';
  bool hasDustStrippingCondition() => _dustStrippingCondition != null;

  // "wasteRemovalCondition" field.
  String? _wasteRemovalCondition;
  String get wasteRemovalCondition => _wasteRemovalCondition ?? '';
  bool hasWasteRemovalCondition() => _wasteRemovalCondition != null;

  // "sectionNeeds" field.
  String? _sectionNeeds;
  String get sectionNeeds => _sectionNeeds ?? '';
  bool hasSectionNeeds() => _sectionNeeds != null;

  // "stateOfHostility" field.
  String? _stateOfHostility;
  String get stateOfHostility => _stateOfHostility ?? '';
  bool hasStateOfHostility() => _stateOfHostility != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "leader" field.
  DocumentReference? _leader;
  DocumentReference? get leader => _leader;
  bool hasLeader() => _leader != null;

  // "sector" field.
  DocumentReference? _sector;
  DocumentReference? get sector => _sector;
  bool hasSector() => _sector != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isReviewed" field.
  bool? _isReviewed;
  bool get isReviewed => _isReviewed ?? false;
  bool hasIsReviewed() => _isReviewed != null;

  // "isMarked" field.
  bool? _isMarked;
  bool get isMarked => _isMarked ?? false;
  bool hasIsMarked() => _isMarked != null;

  void _initializeFields() {
    _sweepCondition = snapshotData['sweepCondition'] as String?;
    _dustStrippingCondition = snapshotData['dustStrippingCondition'] as String?;
    _wasteRemovalCondition = snapshotData['wasteRemovalCondition'] as String?;
    _sectionNeeds = snapshotData['sectionNeeds'] as String?;
    _stateOfHostility = snapshotData['stateOfHostility'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _leader = snapshotData['leader'] as DocumentReference?;
    _sector = snapshotData['sector'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isReviewed = snapshotData['isReviewed'] as bool?;
    _isMarked = snapshotData['isMarked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Daily_Reports');

  static Stream<DailyReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyReportsRecord.fromSnapshot(s));

  static Future<DailyReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyReportsRecord.fromSnapshot(s));

  static DailyReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyReportsRecordData({
  String? sweepCondition,
  String? dustStrippingCondition,
  String? wasteRemovalCondition,
  String? sectionNeeds,
  String? stateOfHostility,
  DocumentReference? createdBy,
  DocumentReference? leader,
  DocumentReference? sector,
  DateTime? createdTime,
  bool? isReviewed,
  bool? isMarked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sweepCondition': sweepCondition,
      'dustStrippingCondition': dustStrippingCondition,
      'wasteRemovalCondition': wasteRemovalCondition,
      'sectionNeeds': sectionNeeds,
      'stateOfHostility': stateOfHostility,
      'createdBy': createdBy,
      'leader': leader,
      'sector': sector,
      'createdTime': createdTime,
      'isReviewed': isReviewed,
      'isMarked': isMarked,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyReportsRecordDocumentEquality
    implements Equality<DailyReportsRecord> {
  const DailyReportsRecordDocumentEquality();

  @override
  bool equals(DailyReportsRecord? e1, DailyReportsRecord? e2) {
    return e1?.sweepCondition == e2?.sweepCondition &&
        e1?.dustStrippingCondition == e2?.dustStrippingCondition &&
        e1?.wasteRemovalCondition == e2?.wasteRemovalCondition &&
        e1?.sectionNeeds == e2?.sectionNeeds &&
        e1?.stateOfHostility == e2?.stateOfHostility &&
        e1?.createdBy == e2?.createdBy &&
        e1?.leader == e2?.leader &&
        e1?.sector == e2?.sector &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isReviewed == e2?.isReviewed &&
        e1?.isMarked == e2?.isMarked;
  }

  @override
  int hash(DailyReportsRecord? e) => const ListEquality().hash([
        e?.sweepCondition,
        e?.dustStrippingCondition,
        e?.wasteRemovalCondition,
        e?.sectionNeeds,
        e?.stateOfHostility,
        e?.createdBy,
        e?.leader,
        e?.sector,
        e?.createdTime,
        e?.isReviewed,
        e?.isMarked
      ]);

  @override
  bool isValidKey(Object? o) => o is DailyReportsRecord;
}
