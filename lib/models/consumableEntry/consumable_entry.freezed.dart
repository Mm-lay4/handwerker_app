// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumable_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsumeEntry _$ConsumeEntryFromJson(Map<String, dynamic> json) {
  return _ConsumeEntry.fromJson(json);
}

/// @nodoc
mixin _$ConsumeEntry {
  DateTime? get createDate => throw _privateConstructorUsedError;
  String? get project => throw _privateConstructorUsedError;
  List<Consumable?> get consumables => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  int? get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumeEntryCopyWith<ConsumeEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumeEntryCopyWith<$Res> {
  factory $ConsumeEntryCopyWith(
          ConsumeEntry value, $Res Function(ConsumeEntry) then) =
      _$ConsumeEntryCopyWithImpl<$Res, ConsumeEntry>;
  @useResult
  $Res call(
      {DateTime? createDate,
      String? project,
      List<Consumable?> consumables,
      String? duration,
      int? cost});
}

/// @nodoc
class _$ConsumeEntryCopyWithImpl<$Res, $Val extends ConsumeEntry>
    implements $ConsumeEntryCopyWith<$Res> {
  _$ConsumeEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createDate = freezed,
    Object? project = freezed,
    Object? consumables = null,
    Object? duration = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      consumables: null == consumables
          ? _value.consumables
          : consumables // ignore: cast_nullable_to_non_nullable
              as List<Consumable?>,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumeEntryImplCopyWith<$Res>
    implements $ConsumeEntryCopyWith<$Res> {
  factory _$$ConsumeEntryImplCopyWith(
          _$ConsumeEntryImpl value, $Res Function(_$ConsumeEntryImpl) then) =
      __$$ConsumeEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? createDate,
      String? project,
      List<Consumable?> consumables,
      String? duration,
      int? cost});
}

/// @nodoc
class __$$ConsumeEntryImplCopyWithImpl<$Res>
    extends _$ConsumeEntryCopyWithImpl<$Res, _$ConsumeEntryImpl>
    implements _$$ConsumeEntryImplCopyWith<$Res> {
  __$$ConsumeEntryImplCopyWithImpl(
      _$ConsumeEntryImpl _value, $Res Function(_$ConsumeEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createDate = freezed,
    Object? project = freezed,
    Object? consumables = null,
    Object? duration = freezed,
    Object? cost = freezed,
  }) {
    return _then(_$ConsumeEntryImpl(
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      consumables: null == consumables
          ? _value._consumables
          : consumables // ignore: cast_nullable_to_non_nullable
              as List<Consumable?>,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumeEntryImpl implements _ConsumeEntry {
  const _$ConsumeEntryImpl(
      {this.createDate,
      this.project,
      final List<Consumable?> consumables = const [],
      this.duration,
      this.cost})
      : _consumables = consumables;

  factory _$ConsumeEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumeEntryImplFromJson(json);

  @override
  final DateTime? createDate;
  @override
  final String? project;
  final List<Consumable?> _consumables;
  @override
  @JsonKey()
  List<Consumable?> get consumables {
    if (_consumables is EqualUnmodifiableListView) return _consumables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumables);
  }

  @override
  final String? duration;
  @override
  final int? cost;

  @override
  String toString() {
    return 'ConsumeEntry(createDate: $createDate, project: $project, consumables: $consumables, duration: $duration, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumeEntryImpl &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.project, project) || other.project == project) &&
            const DeepCollectionEquality()
                .equals(other._consumables, _consumables) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createDate, project,
      const DeepCollectionEquality().hash(_consumables), duration, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumeEntryImplCopyWith<_$ConsumeEntryImpl> get copyWith =>
      __$$ConsumeEntryImplCopyWithImpl<_$ConsumeEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumeEntryImplToJson(
      this,
    );
  }
}

abstract class _ConsumeEntry implements ConsumeEntry {
  const factory _ConsumeEntry(
      {final DateTime? createDate,
      final String? project,
      final List<Consumable?> consumables,
      final String? duration,
      final int? cost}) = _$ConsumeEntryImpl;

  factory _ConsumeEntry.fromJson(Map<String, dynamic> json) =
      _$ConsumeEntryImpl.fromJson;

  @override
  DateTime? get createDate;
  @override
  String? get project;
  @override
  List<Consumable?> get consumables;
  @override
  String? get duration;
  @override
  int? get cost;
  @override
  @JsonKey(ignore: true)
  _$$ConsumeEntryImplCopyWith<_$ConsumeEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
