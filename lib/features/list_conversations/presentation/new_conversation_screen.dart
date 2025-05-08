import 'package:chat_app/features/auth/presentation/providers/auth.dart';
import 'package:chat_app/features/conversation/presentation/conversation_screen.dart';
import 'package:chat_app/features/core/data/user_repository.dart';
import 'package:chat_app/features/core/presentation/providers/supabase_client_provider.dart';
import 'package:chat_app/features/list_conversations/data/conversation_preview_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewConversationScreen extends ConsumerStatefulWidget {
  const NewConversationScreen({super.key});

  @override
  ConsumerState<NewConversationScreen> createState() =>
      _NewConversationScreenState();
}

class _NewConversationScreenState extends ConsumerState<NewConversationScreen> {
  final usernameController = TextEditingController();
  var username = '';

  @override
  void initState() {
    super.initState();
  }

  Future<String> createConversation(String username, WidgetRef ref) async {
    final supabase = ref.watch(supabaseClientProvider);
    final currentUser = ref.watch(authProvider).value;
    final conversationPreviewRepository = ConversationPreviewRepository(
      supabase,
    );
    final profileRepository = ProfileRepository(supabase: supabase);
    final participant2Id = await profileRepository.getProfileByUsername(
      username,
    );
    final conversationId = await conversationPreviewRepository
        .createConversation(username, currentUser!.id, participant2Id.id);
    return conversationId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Conversation')),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'Search Username',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final conversationId = await createConversation(
                usernameController.text,
                ref,
              );
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ConversationScreen(conversationId: conversationId),
                ),
              );
            },
            child: const Text('Create Conversation'),
          ),
        ],
      ),
    );
  }
}
