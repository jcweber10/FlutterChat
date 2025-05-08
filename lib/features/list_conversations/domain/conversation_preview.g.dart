// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationPreviewImpl _$$ConversationPreviewImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationPreviewImpl(
      conversationId: json['conversation_id'] as String,
      conversationName: json['conversation_name'] as String?,
      mostRecentMessageText: json['most_recent_message_text'] as String?,
      mostRecentMessageCreatedAt: json['most_recent_message_created_at'] == null
          ? null
          : DateTime.parse(json['most_recent_message_created_at'] as String),
      senderUsername: json['sender_username'] as String?,
    );

Map<String, dynamic> _$$ConversationPreviewImplToJson(
        _$ConversationPreviewImpl instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'conversation_name': instance.conversationName,
      'most_recent_message_text': instance.mostRecentMessageText,
      'most_recent_message_created_at':
          instance.mostRecentMessageCreatedAt?.toIso8601String(),
      'sender_username': instance.senderUsername,
    };
