import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notice_board_record.g.dart';

abstract class NoticeBoardRecord
    implements Built<NoticeBoardRecord, NoticeBoardRecordBuilder> {
  static Serializer<NoticeBoardRecord> get serializer =>
      _$noticeBoardRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'post_user')
  DocumentReference? get postUser;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  BuiltList<DocumentReference>? get likes;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_votes')
  int? get numVotes;

  bool? get isManager;

  @BuiltValueField(wireName: 'post_link')
  String? get postLink;

  bool? get alert;

  String? get posttype;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NoticeBoardRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..likes = ListBuilder()
    ..numComments = 0
    ..numVotes = 0
    ..isManager = false
    ..postLink = ''
    ..alert = false
    ..posttype = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NoticeBoard');

  static Stream<NoticeBoardRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NoticeBoardRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NoticeBoardRecord._();
  factory NoticeBoardRecord([void Function(NoticeBoardRecordBuilder) updates]) =
      _$NoticeBoardRecord;

  static NoticeBoardRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNoticeBoardRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  bool? isManager,
  String? postLink,
  bool? alert,
  String? posttype,
}) {
  final firestoreData = serializers.toFirestore(
    NoticeBoardRecord.serializer,
    NoticeBoardRecord(
      (n) => n
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..likes = null
        ..numComments = numComments
        ..numVotes = numVotes
        ..isManager = isManager
        ..postLink = postLink
        ..alert = alert
        ..posttype = posttype,
    ),
  );

  return firestoreData;
}
