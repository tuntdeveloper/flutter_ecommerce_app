// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_buyer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationBuyerModel _$NotificationBuyerModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationBuyerModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationBuyerModel {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;
  DateTime? get sendAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationBuyerModelCopyWith<NotificationBuyerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationBuyerModelCopyWith<$Res> {
  factory $NotificationBuyerModelCopyWith(NotificationBuyerModel value,
          $Res Function(NotificationBuyerModel) then) =
      _$NotificationBuyerModelCopyWithImpl<$Res, NotificationBuyerModel>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? title,
      String? description,
      bool seen,
      DateTime? sendAt});
}

/// @nodoc
class _$NotificationBuyerModelCopyWithImpl<$Res,
        $Val extends NotificationBuyerModel>
    implements $NotificationBuyerModelCopyWith<$Res> {
  _$NotificationBuyerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? seen = null,
    Object? sendAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      sendAt: freezed == sendAt
          ? _value.sendAt
          : sendAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationBuyerModelCopyWith<$Res>
    implements $NotificationBuyerModelCopyWith<$Res> {
  factory _$$_NotificationBuyerModelCopyWith(_$_NotificationBuyerModel value,
          $Res Function(_$_NotificationBuyerModel) then) =
      __$$_NotificationBuyerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? title,
      String? description,
      bool seen,
      DateTime? sendAt});
}

/// @nodoc
class __$$_NotificationBuyerModelCopyWithImpl<$Res>
    extends _$NotificationBuyerModelCopyWithImpl<$Res,
        _$_NotificationBuyerModel>
    implements _$$_NotificationBuyerModelCopyWith<$Res> {
  __$$_NotificationBuyerModelCopyWithImpl(_$_NotificationBuyerModel _value,
      $Res Function(_$_NotificationBuyerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? seen = null,
    Object? sendAt = freezed,
  }) {
    return _then(_$_NotificationBuyerModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      sendAt: freezed == sendAt
          ? _value.sendAt
          : sendAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationBuyerModel implements _NotificationBuyerModel {
  const _$_NotificationBuyerModel(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.seen = false,
      this.sendAt});

  factory _$_NotificationBuyerModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationBuyerModelFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool seen;
  @override
  final DateTime? sendAt;

  @override
  String toString() {
    return 'NotificationBuyerModel(id: $id, userId: $userId, title: $title, description: $description, seen: $seen, sendAt: $sendAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationBuyerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            (identical(other.sendAt, sendAt) || other.sendAt == sendAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, title, description, seen, sendAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationBuyerModelCopyWith<_$_NotificationBuyerModel> get copyWith =>
      __$$_NotificationBuyerModelCopyWithImpl<_$_NotificationBuyerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationBuyerModelToJson(
      this,
    );
  }
}

abstract class _NotificationBuyerModel implements NotificationBuyerModel {
  const factory _NotificationBuyerModel(
      {final String? id,
      final String? userId,
      final String? title,
      final String? description,
      final bool seen,
      final DateTime? sendAt}) = _$_NotificationBuyerModel;

  factory _NotificationBuyerModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationBuyerModel.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  bool get seen;
  @override
  DateTime? get sendAt;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationBuyerModelCopyWith<_$_NotificationBuyerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
