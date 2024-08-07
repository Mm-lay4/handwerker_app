// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsumeableVM _$ConsumeableVMFromJson(Map<String, dynamic> json) {
  return _ConsumeableVM.fromJson(json);
}

/// @nodoc
mixin _$ConsumeableVM {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get materialUnitName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumeableVMCopyWith<ConsumeableVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumeableVMCopyWith<$Res> {
  factory $ConsumeableVMCopyWith(
          ConsumeableVM value, $Res Function(ConsumeableVM) then) =
      _$ConsumeableVMCopyWithImpl<$Res, ConsumeableVM>;
  @useResult
  $Res call(
      {String name,
      int id,
      double amount,
      double price,
      String materialUnitName});
}

/// @nodoc
class _$ConsumeableVMCopyWithImpl<$Res, $Val extends ConsumeableVM>
    implements $ConsumeableVMCopyWith<$Res> {
  _$ConsumeableVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? amount = null,
    Object? price = null,
    Object? materialUnitName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialUnitName: null == materialUnitName
          ? _value.materialUnitName
          : materialUnitName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumeableVMImplCopyWith<$Res>
    implements $ConsumeableVMCopyWith<$Res> {
  factory _$$ConsumeableVMImplCopyWith(
          _$ConsumeableVMImpl value, $Res Function(_$ConsumeableVMImpl) then) =
      __$$ConsumeableVMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int id,
      double amount,
      double price,
      String materialUnitName});
}

/// @nodoc
class __$$ConsumeableVMImplCopyWithImpl<$Res>
    extends _$ConsumeableVMCopyWithImpl<$Res, _$ConsumeableVMImpl>
    implements _$$ConsumeableVMImplCopyWith<$Res> {
  __$$ConsumeableVMImplCopyWithImpl(
      _$ConsumeableVMImpl _value, $Res Function(_$ConsumeableVMImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? amount = null,
    Object? price = null,
    Object? materialUnitName = null,
  }) {
    return _then(_$ConsumeableVMImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialUnitName: null == materialUnitName
          ? _value.materialUnitName
          : materialUnitName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumeableVMImpl implements _ConsumeableVM {
  const _$ConsumeableVMImpl(
      {required this.name,
      required this.id,
      required this.amount,
      required this.price,
      required this.materialUnitName});

  factory _$ConsumeableVMImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumeableVMImplFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final double amount;
  @override
  final double price;
  @override
  final String materialUnitName;

  @override
  String toString() {
    return 'ConsumeableVM(name: $name, id: $id, amount: $amount, price: $price, materialUnitName: $materialUnitName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumeableVMImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.materialUnitName, materialUnitName) ||
                other.materialUnitName == materialUnitName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, id, amount, price, materialUnitName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumeableVMImplCopyWith<_$ConsumeableVMImpl> get copyWith =>
      __$$ConsumeableVMImplCopyWithImpl<_$ConsumeableVMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumeableVMImplToJson(
      this,
    );
  }
}

abstract class _ConsumeableVM implements ConsumeableVM {
  const factory _ConsumeableVM(
      {required final String name,
      required final int id,
      required final double amount,
      required final double price,
      required final String materialUnitName}) = _$ConsumeableVMImpl;

  factory _ConsumeableVM.fromJson(Map<String, dynamic> json) =
      _$ConsumeableVMImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  double get amount;
  @override
  double get price;
  @override
  String get materialUnitName;
  @override
  @JsonKey(ignore: true)
  _$$ConsumeableVMImplCopyWith<_$ConsumeableVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
