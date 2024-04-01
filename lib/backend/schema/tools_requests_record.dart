import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ToolsRequestsRecord extends FirestoreRecord {
  ToolsRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "storageKeeper" field.
  DocumentReference? _storageKeeper;
  DocumentReference? get storageKeeper => _storageKeeper;
  bool hasStorageKeeper() => _storageKeeper != null;

  // "tools" field.
  List<ArrayOfToolsStruct>? _tools;
  List<ArrayOfToolsStruct> get tools => _tools ?? const [];
  bool hasTools() => _tools != null;

  // "supervisor" field.
  DocumentReference? _supervisor;
  DocumentReference? get supervisor => _supervisor;
  bool hasSupervisor() => _supervisor != null;

  // "ended_at" field.
  DateTime? _endedAt;
  DateTime? get endedAt => _endedAt;
  bool hasEndedAt() => _endedAt != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _storageKeeper = snapshotData['storageKeeper'] as DocumentReference?;
    _tools = getStructList(
      snapshotData['tools'],
      ArrayOfToolsStruct.fromMap,
    );
    _supervisor = snapshotData['supervisor'] as DocumentReference?;
    _endedAt = snapshotData['ended_at'] as DateTime?;
    _time = snapshotData['time'] as DateTime?;
    _date = snapshotData['date'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tools_Requests');

  static Stream<ToolsRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToolsRequestsRecord.fromSnapshot(s));

  static Future<ToolsRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToolsRequestsRecord.fromSnapshot(s));

  static ToolsRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToolsRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToolsRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToolsRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToolsRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToolsRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToolsRequestsRecordData({
  String? status,
  DateTime? createdAt,
  DocumentReference? storageKeeper,
  DocumentReference? supervisor,
  DateTime? endedAt,
  DateTime? time,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'created_at': createdAt,
      'storageKeeper': storageKeeper,
      'supervisor': supervisor,
      'ended_at': endedAt,
      'time': time,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToolsRequestsRecordDocumentEquality
    implements Equality<ToolsRequestsRecord> {
  const ToolsRequestsRecordDocumentEquality();

  @override
  bool equals(ToolsRequestsRecord? e1, ToolsRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.storageKeeper == e2?.storageKeeper &&
        listEquality.equals(e1?.tools, e2?.tools) &&
        e1?.supervisor == e2?.supervisor &&
        e1?.endedAt == e2?.endedAt &&
        e1?.time == e2?.time &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ToolsRequestsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.createdAt,
        e?.storageKeeper,
        e?.tools,
        e?.supervisor,
        e?.endedAt,
        e?.time,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is ToolsRequestsRecord;
}
