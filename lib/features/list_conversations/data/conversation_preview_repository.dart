import 'package:chat_app/features/list_conversations/domain/conversation_preview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConversationPreviewRepository {
  final SupabaseClient client;
  ConversationPreviewRepository(this.client);

  Future<List<ConversationPreview>> fetchConversationsForUser(
    String userId,
  ) async {
    final response = await client.rpc(
      'get_conversations_with_recent_message',
      params: {'profile_id': userId},
    );
    final data = response as List<dynamic>;
    return data
        .map(
          (json) => ConversationPreview.fromJson(
            Map<String, dynamic>.from(json as Map),
          ),
        )
        .toList();
  }

  Future<String> createConversation(
    String name,
    String participantId,
    String participant2Id,
  ) async {
    final conversationId = await client.rpc(
      'create_conversation_with_participant',
      params: {
        'conversation_name': name,
        'participant_id': participantId,
        'participant_2_id': participant2Id,
      },
    );
    return conversationId;
  }
}
