import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractorsRecord extends FirestoreRecord {
  ContractorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "total_debit" field.
  double? _totalDebit;
  double get totalDebit => _totalDebit ?? 0.0;
  bool hasTotalDebit() => _totalDebit != null;

  // "total_credit" field.
  double? _totalCredit;
  double get totalCredit => _totalCredit ?? 0.0;
  bool hasTotalCredit() => _totalCredit != null;

  // "workersList" field.
  List<DocumentReference>? _workersList;
  List<DocumentReference> get workersList => _workersList ?? const [];
  bool hasWorkersList() => _workersList != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _id = snapshotData['Id'] as String?;
    _totalDebit = castToType<double>(snapshotData['total_debit']);
    _totalCredit = castToType<double>(snapshotData['total_credit']);
    _workersList = getDataList(snapshotData['workersList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contractors');

  static Stream<ContractorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContractorsRecord.fromSnapshot(s));

  static Future<ContractorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContractorsRecord.fromSnapshot(s));

  static ContractorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContractorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContractorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContractorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContractorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContractorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContractorsRecordData({
  String? name,
  String? id,
  double? totalDebit,
  double? totalCredit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'Id': id,
      'total_debit': totalDebit,
      'total_credit': totalCredit,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContractorsRecordDocumentEquality implements Equality<ContractorsRecord> {
  const ContractorsRecordDocumentEquality();

  @override
  bool equals(ContractorsRecord? e1, ContractorsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.id == e2?.id &&
        e1?.totalDebit == e2?.totalDebit &&
        e1?.totalCredit == e2?.totalCredit &&
        listEquality.equals(e1?.workersList, e2?.workersList);
  }

  @override
  int hash(ContractorsRecord? e) => const ListEquality()
      .hash([e?.name, e?.id, e?.totalDebit, e?.totalCredit, e?.workersList]);

  @override
  bool isValidKey(Object? o) => o is ContractorsRecord;
}
