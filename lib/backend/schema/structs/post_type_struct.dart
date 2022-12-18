import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_type_struct.g.dart';

abstract class PostTypeStruct
    implements Built<PostTypeStruct, PostTypeStructBuilder> {
  static Serializer<PostTypeStruct> get serializer =>
      _$postTypeStructSerializer;

  bool? get food;

  bool? get sw;

  bool? get pc;

  @BuiltValueField(wireName: 'HA')
  bool? get ha;

  bool? get dailysupplies;

  bool? get clothing;

  bool? get cosmetic;

  bool? get giftcard;

  bool? get package;

  bool? get ect;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PostTypeStructBuilder builder) => builder
    ..food = false
    ..sw = false
    ..pc = false
    ..ha = false
    ..dailysupplies = false
    ..clothing = false
    ..cosmetic = false
    ..giftcard = false
    ..package = false
    ..ect = false
    ..firestoreUtilData = FirestoreUtilData();

  PostTypeStruct._();
  factory PostTypeStruct([void Function(PostTypeStructBuilder) updates]) =
      _$PostTypeStruct;
}

PostTypeStruct createPostTypeStruct({
  bool? food,
  bool? sw,
  bool? pc,
  bool? ha,
  bool? dailysupplies,
  bool? clothing,
  bool? cosmetic,
  bool? giftcard,
  bool? package,
  bool? ect,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostTypeStruct(
      (p) => p
        ..food = food
        ..sw = sw
        ..pc = pc
        ..ha = ha
        ..dailysupplies = dailysupplies
        ..clothing = clothing
        ..cosmetic = cosmetic
        ..giftcard = giftcard
        ..package = package
        ..ect = ect
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PostTypeStruct? updatePostTypeStruct(
  PostTypeStruct? postType, {
  bool clearUnsetFields = true,
}) =>
    postType != null
        ? (postType.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPostTypeStructData(
  Map<String, dynamic> firestoreData,
  PostTypeStruct? postType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postType == null) {
    return;
  }
  if (postType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && postType.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postTypeData = getPostTypeFirestoreData(postType, forFieldValue);
  final nestedData = postTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = postType.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPostTypeFirestoreData(
  PostTypeStruct? postType, [
  bool forFieldValue = false,
]) {
  if (postType == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PostTypeStruct.serializer, postType);

  // Add any Firestore field values
  postType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostTypeListFirestoreData(
  List<PostTypeStruct>? postTypes,
) =>
    postTypes?.map((p) => getPostTypeFirestoreData(p, true)).toList() ?? [];
