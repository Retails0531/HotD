import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scrap_record.g.dart';

abstract class ScrapRecord implements Built<ScrapRecord, ScrapRecordBuilder> {
  static Serializer<ScrapRecord> get serializer => _$scrapRecordSerializer;

  DocumentReference? get user;

  DocumentReference? get board;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ScrapRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scrap');

  static Stream<ScrapRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScrapRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScrapRecord._();
  factory ScrapRecord([void Function(ScrapRecordBuilder) updates]) =
      _$ScrapRecord;

  static ScrapRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScrapRecordData({
  DocumentReference? user,
  DocumentReference? board,
}) {
  final firestoreData = serializers.toFirestore(
    ScrapRecord.serializer,
    ScrapRecord(
      (s) => s
        ..user = user
        ..board = board,
    ),
  );

  return firestoreData;
}
