import 'package:mirath/core/core.dart';

import '../../domain/entities/chat_message_entity.dart';
import 'chat_message_bubble.dart';
import 'typing_indicator.dart';

class ChatMessagesView extends StatefulWidget {
  final List<ChatMessageEntity> messages;
  final bool isTyping;

  const ChatMessagesView({
    super.key,
    required this.messages,
    this.isTyping = false,
  });

  @override
  State<ChatMessagesView> createState() =>
      _ChatMessagesViewState();
}

class _ChatMessagesViewState
    extends State<ChatMessagesView> {
  final ScrollController _scrollController =
      ScrollController();

  @override
  void didUpdateWidget(
    covariant ChatMessagesView oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);

    if (widget.messages.length !=
            oldWidget.messages.length ||
        widget.isTyping != oldWidget.isTyping) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (!_scrollController.hasClients) return;

        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: context.w(4),
        vertical: context.h(2),
      ),
      itemCount: widget.messages.length +
          (widget.isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (widget.isTyping &&
            index == widget.messages.length) {
          return const TypingIndicator();
        }

        return ChatMessageBubble(
          message: widget.messages[index],
        );
      },
    );
  }
}