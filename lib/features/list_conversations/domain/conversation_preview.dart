import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_preview.freezed.dart';
part 'conversation_preview.g.dart';

@freezed
class ConversationPreview with _$ConversationPreview {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConversationPreview({
    required String conversationId,
    String? conversationName,
    String? mostRecentMessageText,
    DateTime? mostRecentMessageCreatedAt,
    String? senderUsername,
  }) = _ConversationPreview;

  factory ConversationPreview.fromJson(Map<String, dynamic> json) =>
      _$ConversationPreviewFromJson(json);
}
