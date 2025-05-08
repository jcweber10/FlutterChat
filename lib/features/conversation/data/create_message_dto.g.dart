// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMessageDTO _$CreateMessageDTOFromJson(Map<String, dynamic> json) =>
    CreateMessageDTO(
      text: json['text'] as String,
      profileId: json['profile_id'] as String,
      conversationId: json['conversation_id'] as String,
    );

Map<String, dynamic> _$CreateMessageDTOToJson(CreateMessageDTO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'profile_id': instance.profileId,
      'conversation_id': instance.conversationId,
    };
