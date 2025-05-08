import 'package:json_annotation/json_annotation.dart';

part 'create_message_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateMessageDTO {
  final String text;
  final String profileId;
  final String conversationId;

  const CreateMessageDTO({
    required this.text,
    required this.profileId,
    required this.conversationId,
  });

  factory CreateMessageDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CreateMessageDTOToJson(this);
}
