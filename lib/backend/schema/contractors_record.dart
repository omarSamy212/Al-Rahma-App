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

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "diflict_percentage" field.
  double? _diflictPercentage;
  double get diflictPercentage => _diflictPercentage ?? 0.0;
  bool hasDiflictPercentage() => _diflictPercentage != null;

  // "shift_price" field.
  double? _shiftPrice;
  double get shiftPrice => _shiftPrice ?? 0.0;
  bool hasShiftPrice() => _shiftPrice != null;

  // "contract_date" field.
  DateTime? _contractDate;
  DateTime? get contractDate => _contractDate;
  bool hasContractDate() => _contractDate != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "wokersAttendCount" field.
  int? _wokersAttendCount;
  int get wokersAttendCount => _wokersAttendCount ?? 0;
  bool hasWokersAttendCount() => _wokersAttendCount != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _totalDebit = castToType<double>(snapshotData['total_debit']);
    _totalCredit = castToType<double>(snapshotData['total_credit']);
    _workersList = getDataList(snapshotData['workersList']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _diflictPercentage = castToType<double>(snapshotData['diflict_percentage']);
    _shiftPrice = castToType<double>(snapshotData['shift_price']);
    _contractDate = snapshotData['contract_date'] as DateTime?;
    _code = snapshotData['code'] as String?;
    _wokersAttendCount = castToType<int>(snapshotData['wokersAttendCount']);
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
  double? totalDebit,
  double? totalCredit,
  DocumentReference? userRef,
  double? diflictPercentage,
  double? shiftPrice,
  DateTime? contractDate,
  String? code,
  int? wokersAttendCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'total_debit': totalDebit,
      'total_credit': totalCredit,
      'user_ref': userRef,
      'diflict_percentage': diflictPercentage,
      'shift_price': shiftPrice,
      'contract_date': contractDate,
      'code': code,
      'wokersAttendCount': wokersAttendCount,
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
        e1?.totalDebit == e2?.totalDebit &&
        e1?.totalCredit == e2?.totalCredit &&
        listEquality.equals(e1?.workersList, e2?.workersList) &&
        e1?.userRef == e2?.userRef &&
        e1?.diflictPercentage == e2?.diflictPercentage &&
        e1?.shiftPrice == e2?.shiftPrice &&
        e1?.contractDate == e2?.contractDate &&
        e1?.code == e2?.code &&
        e1?.wokersAttendCount == e2?.wokersAttendCount;
  }

  @override
  int hash(ContractorsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.totalDebit,
        e?.totalCredit,
        e?.workersList,
        e?.userRef,
        e?.diflictPercentage,
        e?.shiftPrice,
        e?.contractDate,
        e?.code,
        e?.wokersAttendCount
      ]);

  @override
  bool isValidKey(Object? o) => o is ContractorsRecord;
}
