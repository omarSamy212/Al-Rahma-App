import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class StreetTasksRecord extends FirestoreRecord {
  StreetTasksRecord._(
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

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "taskDescription" field.
  String? _taskDescription;
  String get taskDescription => _taskDescription ?? '';
  bool hasTaskDescription() => _taskDescription != null;

  // "streetRefrence" field.
  DocumentReference? _streetRefrence;
  DocumentReference? get streetRefrence => _streetRefrence;
  bool hasStreetRefrence() => _streetRefrence != null;

  // "isMarked" field.
  bool? _isMarked;
  bool get isMarked => _isMarked ?? false;
  bool hasIsMarked() => _isMarked != null;

  // "isReviewed" field.
  bool? _isReviewed;
  bool get isReviewed => _isReviewed ?? false;
  bool hasIsReviewed() => _isReviewed != null;

  // "taskComment" field.
  String? _taskComment;
  String get taskComment => _taskComment ?? '';
  bool hasTaskComment() => _taskComment != null;

  void _initializeFields() {
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _images = getDataList(snapshotData['images']);
    _taskDescription = snapshotData['taskDescription'] as String?;
    _streetRefrence = snapshotData['streetRefrence'] as DocumentReference?;
    _isMarked = snapshotData['isMarked'] as bool?;
    _isReviewed = snapshotData['isReviewed'] as bool?;
    _taskComment = snapshotData['taskComment'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streetTasks');

  static Stream<StreetTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreetTasksRecord.fromSnapshot(s));

  static Future<StreetTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreetTasksRecord.fromSnapshot(s));

  static StreetTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreetTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreetTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreetTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreetTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreetTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreetTasksRecordData({
  DocumentReference? createdBy,
  DateTime? createdTime,
  String? taskDescription,
  DocumentReference? streetRefrence,
  bool? isMarked,
  bool? isReviewed,
  String? taskComment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdBy': createdBy,
      'createdTime': createdTime,
      'taskDescription': taskDescription,
      'streetRefrence': streetRefrence,
      'isMarked': isMarked,
      'isReviewed': isReviewed,
      'taskComment': taskComment,
    }.withoutNulls,
  );

  return firestoreData;
}

class StreetTasksRecordDocumentEquality implements Equality<StreetTasksRecord> {
  const StreetTasksRecordDocumentEquality();

  @override
  bool equals(StreetTasksRecord? e1, StreetTasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.taskDescription == e2?.taskDescription &&
        e1?.streetRefrence == e2?.streetRefrence &&
        e1?.isMarked == e2?.isMarked &&
        e1?.isReviewed == e2?.isReviewed &&
        e1?.taskComment == e2?.taskComment;
  }

  @override
  int hash(StreetTasksRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.createdTime,
        e?.images,
        e?.taskDescription,
        e?.streetRefrence,
        e?.isMarked,
        e?.isReviewed,
        e?.taskComment
      ]);

  @override
  bool isValidKey(Object? o) => o is StreetTasksRecord;
}
