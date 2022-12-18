// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_board_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NoticeBoardRecord> _$noticeBoardRecordSerializer =
    new _$NoticeBoardRecordSerializer();

class _$NoticeBoardRecordSerializer
    implements StructuredSerializer<NoticeBoardRecord> {
  @override
  final Iterable<Type> types = const [NoticeBoardRecord, _$NoticeBoardRecord];
  @override
  final String wireName = 'NoticeBoardRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, NoticeBoardRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postPhoto;
    if (value != null) {
      result
        ..add('post_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postDescription;
    if (value != null) {
      result
        ..add('post_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUser;
    if (value != null) {
      result
        ..add('post_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timePosted;
    if (value != null) {
      result
        ..add('time_posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('num_comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numVotes;
    if (value != null) {
      result
        ..add('num_votes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isManager;
    if (value != null) {
      result
        ..add('isManager')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.postLink;
    if (value != null) {
      result
        ..add('post_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alert;
    if (value != null) {
      result
        ..add('alert')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.posttype;
    if (value != null) {
      result
        ..add('posttype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  NoticeBoardRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NoticeBoardRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_photo':
          result.postPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_description':
          result.postDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user':
          result.postUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time_posted':
          result.timePosted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'num_comments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_votes':
          result.numVotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isManager':
          result.isManager = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'post_link':
          result.postLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alert':
          result.alert = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'posttype':
          result.posttype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$NoticeBoardRecord extends NoticeBoardRecord {
  @override
  final String? postPhoto;
  @override
  final String? postTitle;
  @override
  final String? postDescription;
  @override
  final DocumentReference<Object?>? postUser;
  @override
  final DateTime? timePosted;
  @override
  final BuiltList<DocumentReference<Object?>>? likes;
  @override
  final int? numComments;
  @override
  final int? numVotes;
  @override
  final bool? isManager;
  @override
  final String? postLink;
  @override
  final bool? alert;
  @override
  final String? posttype;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NoticeBoardRecord(
          [void Function(NoticeBoardRecordBuilder)? updates]) =>
      (new NoticeBoardRecordBuilder()..update(updates))._build();

  _$NoticeBoardRecord._(
      {this.postPhoto,
      this.postTitle,
      this.postDescription,
      this.postUser,
      this.timePosted,
      this.likes,
      this.numComments,
      this.numVotes,
      this.isManager,
      this.postLink,
      this.alert,
      this.posttype,
      this.ffRef})
      : super._();

  @override
  NoticeBoardRecord rebuild(void Function(NoticeBoardRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoticeBoardRecordBuilder toBuilder() =>
      new NoticeBoardRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoticeBoardRecord &&
        postPhoto == other.postPhoto &&
        postTitle == other.postTitle &&
        postDescription == other.postDescription &&
        postUser == other.postUser &&
        timePosted == other.timePosted &&
        likes == other.likes &&
        numComments == other.numComments &&
        numVotes == other.numVotes &&
        isManager == other.isManager &&
        postLink == other.postLink &&
        alert == other.alert &&
        posttype == other.posttype &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, postPhoto.hashCode),
                                                    postTitle.hashCode),
                                                postDescription.hashCode),
                                            postUser.hashCode),
                                        timePosted.hashCode),
                                    likes.hashCode),
                                numComments.hashCode),
                            numVotes.hashCode),
                        isManager.hashCode),
                    postLink.hashCode),
                alert.hashCode),
            posttype.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NoticeBoardRecord')
          ..add('postPhoto', postPhoto)
          ..add('postTitle', postTitle)
          ..add('postDescription', postDescription)
          ..add('postUser', postUser)
          ..add('timePosted', timePosted)
          ..add('likes', likes)
          ..add('numComments', numComments)
          ..add('numVotes', numVotes)
          ..add('isManager', isManager)
          ..add('postLink', postLink)
          ..add('alert', alert)
          ..add('posttype', posttype)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NoticeBoardRecordBuilder
    implements Builder<NoticeBoardRecord, NoticeBoardRecordBuilder> {
  _$NoticeBoardRecord? _$v;

  String? _postPhoto;
  String? get postPhoto => _$this._postPhoto;
  set postPhoto(String? postPhoto) => _$this._postPhoto = postPhoto;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  String? _postDescription;
  String? get postDescription => _$this._postDescription;
  set postDescription(String? postDescription) =>
      _$this._postDescription = postDescription;

  DocumentReference<Object?>? _postUser;
  DocumentReference<Object?>? get postUser => _$this._postUser;
  set postUser(DocumentReference<Object?>? postUser) =>
      _$this._postUser = postUser;

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  ListBuilder<DocumentReference<Object?>>? _likes;
  ListBuilder<DocumentReference<Object?>> get likes =>
      _$this._likes ??= new ListBuilder<DocumentReference<Object?>>();
  set likes(ListBuilder<DocumentReference<Object?>>? likes) =>
      _$this._likes = likes;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  int? _numVotes;
  int? get numVotes => _$this._numVotes;
  set numVotes(int? numVotes) => _$this._numVotes = numVotes;

  bool? _isManager;
  bool? get isManager => _$this._isManager;
  set isManager(bool? isManager) => _$this._isManager = isManager;

  String? _postLink;
  String? get postLink => _$this._postLink;
  set postLink(String? postLink) => _$this._postLink = postLink;

  bool? _alert;
  bool? get alert => _$this._alert;
  set alert(bool? alert) => _$this._alert = alert;

  String? _posttype;
  String? get posttype => _$this._posttype;
  set posttype(String? posttype) => _$this._posttype = posttype;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NoticeBoardRecordBuilder() {
    NoticeBoardRecord._initializeBuilder(this);
  }

  NoticeBoardRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postPhoto = $v.postPhoto;
      _postTitle = $v.postTitle;
      _postDescription = $v.postDescription;
      _postUser = $v.postUser;
      _timePosted = $v.timePosted;
      _likes = $v.likes?.toBuilder();
      _numComments = $v.numComments;
      _numVotes = $v.numVotes;
      _isManager = $v.isManager;
      _postLink = $v.postLink;
      _alert = $v.alert;
      _posttype = $v.posttype;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NoticeBoardRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NoticeBoardRecord;
  }

  @override
  void update(void Function(NoticeBoardRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NoticeBoardRecord build() => _build();

  _$NoticeBoardRecord _build() {
    _$NoticeBoardRecord _$result;
    try {
      _$result = _$v ??
          new _$NoticeBoardRecord._(
              postPhoto: postPhoto,
              postTitle: postTitle,
              postDescription: postDescription,
              postUser: postUser,
              timePosted: timePosted,
              likes: _likes?.build(),
              numComments: numComments,
              numVotes: numVotes,
              isManager: isManager,
              postLink: postLink,
              alert: alert,
              posttype: posttype,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likes';
        _likes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NoticeBoardRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
