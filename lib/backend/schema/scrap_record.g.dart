// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScrapRecord> _$scrapRecordSerializer = new _$ScrapRecordSerializer();

class _$ScrapRecordSerializer implements StructuredSerializer<ScrapRecord> {
  @override
  final Iterable<Type> types = const [ScrapRecord, _$ScrapRecord];
  @override
  final String wireName = 'ScrapRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScrapRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.board;
    if (value != null) {
      result
        ..add('board')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ScrapRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScrapRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'board':
          result.board = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ScrapRecord extends ScrapRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? board;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScrapRecord([void Function(ScrapRecordBuilder)? updates]) =>
      (new ScrapRecordBuilder()..update(updates))._build();

  _$ScrapRecord._({this.user, this.board, this.ffRef}) : super._();

  @override
  ScrapRecord rebuild(void Function(ScrapRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScrapRecordBuilder toBuilder() => new ScrapRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScrapRecord &&
        user == other.user &&
        board == other.board &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, user.hashCode), board.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScrapRecord')
          ..add('user', user)
          ..add('board', board)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScrapRecordBuilder implements Builder<ScrapRecord, ScrapRecordBuilder> {
  _$ScrapRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _board;
  DocumentReference<Object?>? get board => _$this._board;
  set board(DocumentReference<Object?>? board) => _$this._board = board;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScrapRecordBuilder() {
    ScrapRecord._initializeBuilder(this);
  }

  ScrapRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _board = $v.board;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScrapRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScrapRecord;
  }

  @override
  void update(void Function(ScrapRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScrapRecord build() => _build();

  _$ScrapRecord _build() {
    final _$result =
        _$v ?? new _$ScrapRecord._(user: user, board: board, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
