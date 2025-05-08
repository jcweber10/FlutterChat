// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationPreview _$ConversationPreviewFromJson(Map<String, dynamic> json) {
  return _ConversationPreview.fromJson(json);
}

/// @nodoc
mixin _$ConversationPreview {
  String get conversationId => throw _privateConstructorUsedError;
  String? get conversationName => throw _privateConstructorUsedError;
  String? get mostRecentMessageText => throw _privateConstructorUsedError;
  DateTime? get mostRecentMessageCreatedAt =>
      throw _privateConstructorUsedError;
  String? get senderUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationPreviewCopyWith<ConversationPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationPreviewCopyWith<$Res> {
  factory $ConversationPreviewCopyWith(
          ConversationPreview value, $Res Function(ConversationPreview) then) =
      _$ConversationPreviewCopyWithImpl<$Res, ConversationPreview>;
  @useResult
  $Res call(
      {String conversationId,
      String? conversationName,
      String? mostRecentMessageText,
      DateTime? mostRecentMessageCreatedAt,
      String? senderUsername});
}

/// @nodoc
class _$ConversationPreviewCopyWithImpl<$Res, $Val extends ConversationPreview>
    implements $ConversationPreviewCopyWith<$Res> {
  _$ConversationPreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? conversationName = freezed,
    Object? mostRecentMessageText = freezed,
    Object? mostRecentMessageCreatedAt = freezed,
    Object? senderUsername = freezed,
  }) {
    return _then(_value.copyWith(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationName: freezed == conversationName
          ? _value.conversationName
          : conversationName // ignore: cast_nullable_to_non_nullable
              as String?,
      mostRecentMessageText: freezed == mostRecentMessageText
          ? _value.mostRecentMessageText
          : mostRecentMessageText // ignore: cast_nullable_to_non_nullable
              as String?,
      mostRecentMessageCreatedAt: freezed == mostRecentMessageCreatedAt
          ? _value.mostRecentMessageCreatedAt
          : mostRecentMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      senderUsername: freezed == senderUsername
          ? _value.senderUsername
          : senderUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationPreviewImplCopyWith<$Res>
    implements $ConversationPreviewCopyWith<$Res> {
  factory _$$ConversationPreviewImplCopyWith(_$ConversationPreviewImpl value,
          $Res Function(_$ConversationPreviewImpl) then) =
      __$$ConversationPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String conversationId,
      String? conversationName,
      String? mostRecentMessageText,
      DateTime? mostRecentMessageCreatedAt,
      String? senderUsername});
}

/// @nodoc
class __$$ConversationPreviewImplCopyWithImpl<$Res>
    extends _$ConversationPreviewCopyWithImpl<$Res, _$ConversationPreviewImpl>
    implements _$$ConversationPreviewImplCopyWith<$Res> {
  __$$ConversationPreviewImplCopyWithImpl(_$ConversationPreviewImpl _value,
      $Res Function(_$ConversationPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? conversationName = freezed,
    Object? mostRecentMessageText = freezed,
    Object? mostRecentMessageCreatedAt = freezed,
    Object? senderUsername = freezed,
  }) {
    return _then(_$ConversationPreviewImpl(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationName: freezed == conversationName
          ? _value.conversationName
          : conversationName // ignore: cast_nullable_to_non_nullable
              as String?,
      mostRecentMessageText: freezed == mostRecentMessageText
          ? _value.mostRecentMessageText
          : mostRecentMessageText // ignore: cast_nullable_to_non_nullable
              as String?,
      mostRecentMessageCreatedAt: freezed == mostRecentMessageCreatedAt
          ? _value.mostRecentMessageCreatedAt
          : mostRecentMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      senderUsername: freezed == senderUsername
          ? _value.senderUsername
          : senderUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ConversationPreviewImpl implements _ConversationPreview {
  const _$ConversationPreviewImpl(
      {required this.conversationId,
      this.conversationName,
      this.mostRecentMessageText,
      this.mostRecentMessageCreatedAt,
      this.senderUsername});

  factory _$ConversationPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationPreviewImplFromJson(json);

  @override
  final String conversationId;
  @override
  final String? conversationName;
  @override
  final String? mostRecentMessageText;
  @override
  final DateTime? mostRecentMessageCreatedAt;
  @override
  final String? senderUsername;

  @override
  String toString() {
    return 'ConversationPreview(conversationId: $conversationId, conversationName: $conversationName, mostRecentMessageText: $mostRecentMessageText, mostRecentMessageCreatedAt: $mostRecentMessageCreatedAt, senderUsername: $senderUsername)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationPreviewImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.conversationName, conversationName) ||
                other.conversationName == conversationName) &&
            (identical(other.mostRecentMessageText, mostRecentMessageText) ||
                other.mostRecentMessageText == mostRecentMessageText) &&
            (identical(other.mostRecentMessageCreatedAt,
                    mostRecentMessageCreatedAt) ||
                other.mostRecentMessageCreatedAt ==
                    mostRecentMessageCreatedAt) &&
            (identical(other.senderUsername, senderUsername) ||
                other.senderUsername == senderUsername));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conversationId, conversationName,
      mostRecentMessageText, mostRecentMessageCreatedAt, senderUsername);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationPreviewImplCopyWith<_$ConversationPreviewImpl> get copyWith =>
      __$$ConversationPreviewImplCopyWithImpl<_$ConversationPreviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationPreviewImplToJson(
      this,
    );
  }
}

abstract class _ConversationPreview implements ConversationPreview {
  const factory _ConversationPreview(
      {required final String conversationId,
      final String? conversationName,
      final String? mostRecentMessageText,
      final DateTime? mostRecentMessageCreatedAt,
      final String? senderUsername}) = _$ConversationPreviewImpl;

  factory _ConversationPreview.fromJson(Map<String, dynamic> json) =
      _$ConversationPreviewImpl.fromJson;

  @override
  String get conversationId;
  @override
  String? get conversationName;
  @override
  String? get mostRecentMessageText;
  @override
  DateTime? get mostRecentMessageCreatedAt;
  @override
  String? get senderUsername;
  @override
  @JsonKey(ignore: true)
  _$$ConversationPreviewImplCopyWith<_$ConversationPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
