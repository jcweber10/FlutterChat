import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:chat_app/features/list_conversations/domain/conversation_preview.dart';
import 'package:chat_app/features/list_conversations/data/conversation_preview_repository.dart';
import 'package:chat_app/features/core/presentation/providers/supabase_client_provider.dart';
import 'package:chat_app/features/auth/presentation/providers/auth.dart';

part 'conversation_list_provider.g.dart';

@riverpod
class ConversationList extends _$ConversationList {
  @override
  Future<List<ConversationPreview>> build() async {
    final user = ref.watch(authProvider).value;
    if (user == null) return [];
    final client = ref.read(supabaseClientProvider);
    final repo = ConversationPreviewRepository(client);
    return repo.fetchConversationsForUser(user.id);
  }
}
