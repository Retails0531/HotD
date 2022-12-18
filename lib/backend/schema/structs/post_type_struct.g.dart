// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_type_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostTypeStruct> _$postTypeStructSerializer =
    new _$PostTypeStructSerializer();

class _$PostTypeStructSerializer
    implements StructuredSerializer<PostTypeStruct> {
  @override
  final Iterable<Type> types = const [PostTypeStruct, _$PostTypeStruct];
  @override
  final String wireName = 'PostTypeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostTypeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.food;
    if (value != null) {
      result
        ..add('food')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sw;
    if (value != null) {
      result
        ..add('sw')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pc;
    if (value != null) {
      result
        ..add('pc')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ha;
    if (value != null) {
      result
        ..add('HA')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dailysupplies;
    if (value != null) {
      result
        ..add('dailysupplies')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.clothing;
    if (value != null) {
      result
        ..add('clothing')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cosmetic;
    if (value != null) {
      result
        ..add('cosmetic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.giftcard;
    if (value != null) {
      result
        ..add('giftcard')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.package;
    if (value != null) {
      result
        ..add('package')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ect;
    if (value != null) {
      result
        ..add('ect')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  PostTypeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostTypeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'food':
          result.food = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sw':
          result.sw = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pc':
          result.pc = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'HA':
          result.ha = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dailysupplies':
          result.dailysupplies = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'clothing':
          result.clothing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cosmetic':
          result.cosmetic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'giftcard':
          result.giftcard = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'package':
          result.package = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ect':
          result.ect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$PostTypeStruct extends PostTypeStruct {
  @override
  final bool? food;
  @override
  final bool? sw;
  @override
  final bool? pc;
  @override
  final bool? ha;
  @override
  final bool? dailysupplies;
  @override
  final bool? clothing;
  @override
  final bool? cosmetic;
  @override
  final bool? giftcard;
  @override
  final bool? package;
  @override
  final bool? ect;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PostTypeStruct([void Function(PostTypeStructBuilder)? updates]) =>
      (new PostTypeStructBuilder()..update(updates))._build();

  _$PostTypeStruct._(
      {this.food,
      this.sw,
      this.pc,
      this.ha,
      this.dailysupplies,
      this.clothing,
      this.cosmetic,
      this.giftcard,
      this.package,
      this.ect,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PostTypeStruct', 'firestoreUtilData');
  }

  @override
  PostTypeStruct rebuild(void Function(PostTypeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostTypeStructBuilder toBuilder() =>
      new PostTypeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostTypeStruct &&
        food == other.food &&
        sw == other.sw &&
        pc == other.pc &&
        ha == other.ha &&
        dailysupplies == other.dailysupplies &&
        clothing == other.clothing &&
        cosmetic == other.cosmetic &&
        giftcard == other.giftcard &&
        package == other.package &&
        ect == other.ect &&
        firestoreUtilData == other.firestoreUtilData;
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
                                    $jc($jc($jc(0, food.hashCode), sw.hashCode),
                                        pc.hashCode),
                                    ha.hashCode),
                                dailysupplies.hashCode),
                            clothing.hashCode),
                        cosmetic.hashCode),
                    giftcard.hashCode),
                package.hashCode),
            ect.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostTypeStruct')
          ..add('food', food)
          ..add('sw', sw)
          ..add('pc', pc)
          ..add('ha', ha)
          ..add('dailysupplies', dailysupplies)
          ..add('clothing', clothing)
          ..add('cosmetic', cosmetic)
          ..add('giftcard', giftcard)
          ..add('package', package)
          ..add('ect', ect)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PostTypeStructBuilder
    implements Builder<PostTypeStruct, PostTypeStructBuilder> {
  _$PostTypeStruct? _$v;

  bool? _food;
  bool? get food => _$this._food;
  set food(bool? food) => _$this._food = food;

  bool? _sw;
  bool? get sw => _$this._sw;
  set sw(bool? sw) => _$this._sw = sw;

  bool? _pc;
  bool? get pc => _$this._pc;
  set pc(bool? pc) => _$this._pc = pc;

  bool? _ha;
  bool? get ha => _$this._ha;
  set ha(bool? ha) => _$this._ha = ha;

  bool? _dailysupplies;
  bool? get dailysupplies => _$this._dailysupplies;
  set dailysupplies(bool? dailysupplies) =>
      _$this._dailysupplies = dailysupplies;

  bool? _clothing;
  bool? get clothing => _$this._clothing;
  set clothing(bool? clothing) => _$this._clothing = clothing;

  bool? _cosmetic;
  bool? get cosmetic => _$this._cosmetic;
  set cosmetic(bool? cosmetic) => _$this._cosmetic = cosmetic;

  bool? _giftcard;
  bool? get giftcard => _$this._giftcard;
  set giftcard(bool? giftcard) => _$this._giftcard = giftcard;

  bool? _package;
  bool? get package => _$this._package;
  set package(bool? package) => _$this._package = package;

  bool? _ect;
  bool? get ect => _$this._ect;
  set ect(bool? ect) => _$this._ect = ect;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PostTypeStructBuilder() {
    PostTypeStruct._initializeBuilder(this);
  }

  PostTypeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _food = $v.food;
      _sw = $v.sw;
      _pc = $v.pc;
      _ha = $v.ha;
      _dailysupplies = $v.dailysupplies;
      _clothing = $v.clothing;
      _cosmetic = $v.cosmetic;
      _giftcard = $v.giftcard;
      _package = $v.package;
      _ect = $v.ect;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostTypeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostTypeStruct;
  }

  @override
  void update(void Function(PostTypeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostTypeStruct build() => _build();

  _$PostTypeStruct _build() {
    final _$result = _$v ??
        new _$PostTypeStruct._(
            food: food,
            sw: sw,
            pc: pc,
            ha: ha,
            dailysupplies: dailysupplies,
            clothing: clothing,
            cosmetic: cosmetic,
            giftcard: giftcard,
            package: package,
            ect: ect,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PostTypeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
