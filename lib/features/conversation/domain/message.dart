import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Message({
    required String id,
    required String profileId,
    required String text,
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
