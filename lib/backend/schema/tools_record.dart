import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolsRecord extends FirestoreRecord {
  ToolsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  bool hasCondition() => _condition != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "toolImage" field.
  String? _toolImage;
  String get toolImage => _toolImage ?? '';
  bool hasToolImage() => _toolImage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _condition = snapshotData['condition'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _toolImage = snapshotData['toolImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tools');

  static Stream<ToolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToolsRecord.fromSnapshot(s));

  static Future<ToolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToolsRecord.fromSnapshot(s));

  static ToolsRecord fromSnapshot(DocumentSnapshot snapshot) => ToolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToolsRecordData({
  String? name,
  String? specifications,
  int? quantity,
  String? condition,
  DateTime? createdAt,
  String? toolImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'specifications': specifications,
      'quantity': quantity,
      'condition': condition,
      'created_at': createdAt,
      'toolImage': toolImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToolsRecordDocumentEquality implements Equality<ToolsRecord> {
  const ToolsRecordDocumentEquality();

  @override
  bool equals(ToolsRecord? e1, ToolsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.specifications == e2?.specifications &&
        e1?.quantity == e2?.quantity &&
        e1?.condition == e2?.condition &&
        e1?.createdAt == e2?.createdAt &&
        e1?.toolImage == e2?.toolImage;
  }

  @override
  int hash(ToolsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.specifications,
        e?.quantity,
        e?.condition,
        e?.createdAt,
        e?.toolImage
      ]);

  @override
  bool isValidKey(Object? o) => o is ToolsRecord;
}
