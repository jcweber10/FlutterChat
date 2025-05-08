import 'package:chat_app/features/conversation/data/create_message_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/message.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'messages_provider.g.dart';

@riverpod
class Messages extends _$Messages {
  @override
  Stream<List<Message>> build(String conversationId) {
    final supabase = Supabase.instance.client;
    return supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('conversation_id', conversationId)
        .order('created_at')
        .map(
          (data) => data
              .map((json) => Message.fromJson(json))
              .toList()
              .reversed
              .toList(),
        );
  }

  Future<void> sendMessage({
    required String text,
    required String profileId,
    required String conversationId,
  }) async {
    final supabase = Supabase.instance.client;
    final newMessage = CreateMessageDTO(
      text: text,
      profileId: profileId,
      conversationId: conversationId,
    );
    try {
      await supabase.from('messages').insert(newMessage.toJson());
    } catch (e, st) {
      print(e);
      state = AsyncError(e, st);
    }
  }
}
