import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MovmentRequestRecord extends FirestoreRecord {
  MovmentRequestRecord._(
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
    _reportDescription = snapshotData['reportDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movmentRequest');

  static Stream<MovmentRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MovmentRequestRecord.fromSnapshot(s));

  static Future<MovmentRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MovmentRequestRecord.fromSnapshot(s));

  static MovmentRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovmentRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovmentRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovmentRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovmentRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovmentRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovmentRequestRecordData({
  DocumentReference? createdBy,
  DateTime? createdTime,
  String? carType,
  DocumentReference? userReported,
  String? carLicense,
  String? reportDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdBy': createdBy,
      'createdTime': createdTime,
      'carType': carType,
      'userReported': userReported,
      'carLicense': carLicense,
      'reportDescription': reportDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovmentRequestRecordDocumentEquality
    implements Equality<MovmentRequestRecord> {
  const MovmentRequestRecordDocumentEquality();

  @override
  bool equals(MovmentRequestRecord? e1, MovmentRequestRecord? e2) {
    return e1?.createdBy == e2?.createdBy &&
        e1?.createdTime == e2?.createdTime &&
        e1?.carType == e2?.carType &&
        e1?.userReported == e2?.userReported &&
        e1?.carLicense == e2?.carLicense &&
        e1?.reportDescription == e2?.reportDescription;
  }

  @override
  int hash(MovmentRequestRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.createdTime,
        e?.carType,
        e?.userReported,
        e?.carLicense,
        e?.reportDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is MovmentRequestRecord;
}
