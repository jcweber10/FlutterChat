import 'package:chat_app/features/list_conversations/presentation/list_conversations_preview_row.dart';
import 'package:chat_app/features/list_conversations/presentation/new_conversation_screen.dart';
import 'package:chat_app/features/list_conversations/presentation/providers/conversation_list_provider.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListConversationsScreen extends ConsumerStatefulWidget {
  const ListConversationsScreen({super.key});

  @override
  ConsumerState<ListConversationsScreen> createState() =>
      _ListConversationsScreenState();
}

class _ListConversationsScreenState
    extends ConsumerState<ListConversationsScreen>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    ref.invalidate(conversationListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final conversations = ref.watch(conversationListProvider).value;
    return Scaffold(
      appBar: AppBar(title: const Text('Chats'), centerTitle: true),
      body: ListView.builder(
        itemCount: conversations?.length ?? 0,
        itemBuilder: (context, index) {
          return ListConversationsPreviewRow(
            conversationPreview: conversations![index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewConversationScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
