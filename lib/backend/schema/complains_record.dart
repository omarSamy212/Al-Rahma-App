import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComplainsRecord extends FirestoreRecord {
  ComplainsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "complainerID" field.
  DocumentReference? _complainerID;
  DocumentReference? get complainerID => _complainerID;
  bool hasComplainerID() => _complainerID != null;

  // "complainee" field.
  DocumentReference? _complainee;
  DocumentReference? get complainee => _complainee;
  bool hasComplainee() => _complainee != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "textDescription" field.
  String? _textDescription;
  String get textDescription => _textDescription ?? '';
  bool hasTextDescription() => _textDescription != null;

  // "requestID" field.
  DocumentReference? _requestID;
  DocumentReference? get requestID => _requestID;
  bool hasRequestID() => _requestID != null;

  // "audioDescription" field.
  String? _audioDescription;
  String get audioDescription => _audioDescription ?? '';
  bool hasAudioDescription() => _audioDescription != null;

  // "toolID" field.
  String? _toolID;
  String get toolID => _toolID ?? '';
  bool hasToolID() => _toolID != null;

  // "toolName" field.
  String? _toolName;
  String get toolName => _toolName ?? '';
  bool hasToolName() => _toolName != null;

  // "quantityMissing" field.
  int? _quantityMissing;
  int get quantityMissing => _quantityMissing ?? 0;
  bool hasQuantityMissing() => _quantityMissing != null;

  void _initializeFields() {
    _complainerID = snapshotData['complainerID'] as DocumentReference?;
    _complainee = snapshotData['complainee'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _textDescription = snapshotData['textDescription'] as String?;
    _requestID = snapshotData['requestID'] as DocumentReference?;
    _audioDescription = snapshotData['audioDescription'] as String?;
    _toolID = snapshotData['toolID'] as String?;
    _toolName = snapshotData['toolName'] as String?;
    _quantityMissing = castToType<int>(snapshotData['quantityMissing']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('complains');

  static Stream<ComplainsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComplainsRecord.fromSnapshot(s));

  static Future<ComplainsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComplainsRecord.fromSnapshot(s));

  static ComplainsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComplainsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComplainsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComplainsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComplainsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComplainsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComplainsRecordData({
  DocumentReference? complainerID,
  DocumentReference? complainee,
  String? status,
  String? textDescription,
  DocumentReference? requestID,
  String? audioDescription,
  String? toolID,
  String? toolName,
  int? quantityMissing,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'complainerID': complainerID,
      'complainee': complainee,
      'status': status,
      'textDescription': textDescription,
      'requestID': requestID,
      'audioDescription': audioDescription,
      'toolID': toolID,
      'toolName': toolName,
      'quantityMissing': quantityMissing,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComplainsRecordDocumentEquality implements Equality<ComplainsRecord> {
  const ComplainsRecordDocumentEquality();

  @override
  bool equals(ComplainsRecord? e1, ComplainsRecord? e2) {
    return e1?.complainerID == e2?.complainerID &&
        e1?.complainee == e2?.complainee &&
        e1?.status == e2?.status &&
        e1?.textDescription == e2?.textDescription &&
        e1?.requestID == e2?.requestID &&
        e1?.audioDescription == e2?.audioDescription &&
        e1?.toolID == e2?.toolID &&
        e1?.toolName == e2?.toolName &&
        e1?.quantityMissing == e2?.quantityMissing;
  }

  @override
  int hash(ComplainsRecord? e) => const ListEquality().hash([
        e?.complainerID,
        e?.complainee,
        e?.status,
        e?.textDescription,
        e?.requestID,
        e?.audioDescription,
        e?.toolID,
        e?.toolName,
        e?.quantityMissing
      ]);

  @override
  bool isValidKey(Object? o) => o is ComplainsRecord;
}
