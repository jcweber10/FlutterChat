import 'package:chat_app/features/auth/presentation/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/message.dart';
import 'providers/messages_provider.dart';

class ConversationScreen extends ConsumerWidget {
  const ConversationScreen({super.key, required this.conversationId});

  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesStream = ref.watch(messagesProvider(conversationId));
    final currentUserProfileId = ref.watch(authProvider).value?.id;
    return Scaffold(
      appBar: AppBar(title: Text('Chat - $conversationId'), centerTitle: true),
      body: Column(
        children: [
          messagesStream.when(
            data: (messages) => Expanded(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  final isMe = message.profileId == currentUserProfileId;
                  return _ChatBubble(message: message, isMe: isMe);
                },
              ),
            ),
            error: (Object error, StackTrace stackTrace) {
              print(error);
              return const Center(child: Text('Error'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: _TypeMessageRow(
              profileId: currentUserProfileId,
              conversationId: conversationId,
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeMessageRow extends ConsumerStatefulWidget {
  final String? profileId;
  final String conversationId;
  const _TypeMessageRow({
    super.key,
    this.profileId,
    required this.conversationId,
  });

  @override
  ConsumerState<_TypeMessageRow> createState() => _TypeMessageRowState();
}

class _TypeMessageRowState extends ConsumerState<_TypeMessageRow> {
  final TextEditingController controller = TextEditingController();
  String _currentMessage = '';
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _currentMessage = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Type a message',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              border: InputBorder.none,
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                ref
                    .read(messagesProvider(widget.conversationId).notifier)
                    .sendMessage(
                      text: value.trim(),
                      profileId: widget.profileId ?? '',
                      conversationId: widget.conversationId,
                    );
                controller.clear();
              }
            },
          ),
        ),
        IconButton(
          color: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.send),
          onPressed: _currentMessage.trim().isEmpty
              ? null
              : () {
                  ref
                      .read(messagesProvider(widget.conversationId).notifier)
                      .sendMessage(
                        text: _currentMessage,
                        profileId: widget.profileId ?? '',
                        conversationId: widget.conversationId,
                      );
                  controller.clear();
                },
        ),
      ],
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const _ChatBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      backgroundColor: isMe
          ? Theme.of(context).colorScheme.primary
          : Colors.grey.shade400,
      child: Text(
        message.profileId.substring(0, 2),
        style: const TextStyle(color: Colors.white),
      ),
    );
    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isMe
            ? [bubble, const SizedBox(width: 8), avatar]
            : [avatar, const SizedBox(width: 8), bubble],
      ),
    );
  }
}
