import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "contractorRef" field.
  DocumentReference? _contractorRef;
  DocumentReference? get contractorRef => _contractorRef;
  bool hasContractorRef() => _contractorRef != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _contractorRef = snapshotData['contractorRef'] as DocumentReference?;
    _details = snapshotData['details'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _value = castToType<double>(snapshotData['value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  String? type,
  DocumentReference? contractorRef,
  String? details,
  DateTime? date,
  double? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'contractorRef': contractorRef,
      'details': details,
      'date': date,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.contractorRef == e2?.contractorRef &&
        e1?.details == e2?.details &&
        e1?.date == e2?.date &&
        e1?.value == e2?.value;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality()
      .hash([e?.type, e?.contractorRef, e?.details, e?.date, e?.value]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
