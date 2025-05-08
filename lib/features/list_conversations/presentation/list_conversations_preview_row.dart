import 'package:chat_app/features/conversation/presentation/conversation_screen.dart';
import 'package:chat_app/features/list_conversations/domain/conversation_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListConversationsPreviewRow extends ConsumerWidget {
  const ListConversationsPreviewRow({
    super.key,
    required this.conversationPreview,
  });

  final ConversationPreview conversationPreview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationScreen(
              conversationId: conversationPreview.conversationId,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversationPreview.conversationName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    conversationPreview.mostRecentMessageText ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // format date relative using intl
            const SizedBox(width: 8),
            Text(
              timeago.format(conversationPreview.mostRecentMessageCreatedAt!),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
