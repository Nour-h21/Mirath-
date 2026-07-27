import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/core.dart';
import '../bloc/ai_chat_bloc.dart';
import '../bloc/ai_chat_event.dart';
import '../bloc/ai_chat_state.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_input_field.dart';

import '../widgets/chat_messages_view.dart';
import '../widgets/conversations_drawer.dart';
import '../widgets/empty_chat_view.dart';

import 'conversations.dart';

// class AiChatPage extends StatefulWidget {
//   final int? conversationId;

//   const AiChatPage({
//     super.key,
//     this.conversationId,
//   });

//   @override
//   State<AiChatPage> createState() => _AiChatPageState();
// }

// class _AiChatPageState extends State<AiChatPage> {
//   final TextEditingController _messageController =
//       TextEditingController();

//   final ScrollController _scrollController =
//       ScrollController();

//   late List<DummyChatMessage> messages;

//   bool isTyping = false;

//   @override
//   void initState() {
//     super.initState();

//     messages = widget.conversationId == null
//         ? []
//         : List.from(dummyMessages);
//   }

//   @override
//   void dispose() {
//     _messageController.dispose();
//     _scrollController.dispose();

//     super.dispose();
//   }

//   void _sendMessage() {
//     final message = _messageController.text.trim();

//     if (message.isEmpty) return;

//     setState(() {
//       messages.add(
//         DummyChatMessage(
//           message: message,
//           sender: MessageSender.user,
//           time: DateTime.now(),
//         ),
//       );

//       _messageController.clear();

//       isTyping = true;
//     });

//     _scrollToBottom();

//     Future.delayed(
//       const Duration(seconds: 2),
//       () {
//         if (!mounted) return;

//         setState(() {
//           isTyping = false;

//           messages.add(
//             DummyChatMessage(
//               message:
//                   'هذا رد تجريبي من مساعد ميراث. لاحقًا سيتم استبداله بالرد القادم من الـ Backend والـ AI Model.',
//               sender: MessageSender.assistant,
//               time: DateTime.now(),
//             ),
//           );
//         });

//         _scrollToBottom();
//       },
//     );
//   }

//   void _scrollToBottom() {
//     Future.delayed(
//       const Duration(milliseconds: 100),
//       () {
//         if (!_scrollController.hasClients) return;

//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       },
//     );
//   }

//   void _createNewChat() {
//     setState(() {
//       messages.clear();
//       isTyping = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.offWhite,
//       body: SafeArea(
//         child: Column(
//           children: [
//             ChatHeader(
//               onNewChat: _createNewChat,
//              onShowConversations: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (_) => const ConversationsPage(),
//     ),
//   );
// },
//             ),

//             Expanded(
//               child: messages.isEmpty
//                   ? EmptyChatView(
//                       onSuggestionSelected: (suggestion) {
//                         _messageController.text = suggestion;
//                       },
//                     )
//                   : ListView.builder(
//                       controller: _scrollController,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: context.w(4),
//                         vertical: context.h(2),
//                       ),
//                       itemCount: messages.length +
//                           (isTyping ? 1 : 0),
//                       itemBuilder: (context, index) {
//                         if (isTyping &&
//                             index == messages.length) {
//                           return const TypingIndicator();
//                         }

//                         return ChatMessageBubble(
//                           message: messages[index],
//                         );
//                       },
//                     ),
//             ),

//             ChatInputField(
//               controller: _messageController,
//               onSend: _sendMessage,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AiChatPage extends StatelessWidget {
  final int? conversationId;

  const AiChatPage({super.key, this.conversationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AiChatBloc>(param1: conversationId),
      child: const _AiChatView(),
    );
  }
}

class _AiChatView extends StatefulWidget {
  const _AiChatView();

  @override
  State<_AiChatView> createState() => _AiChatViewState();
}

class _AiChatViewState extends State<_AiChatView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();

    super.dispose();
  }

  // إرسال رسالة
  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isEmpty) return;

    context.read<AiChatBloc>().add(SendQuestionEvent(question: message));

    _messageController.clear();
  }

  // فتح محادثة قديمة
  void _openConversation(int conversationId) {
    // إغلاق الـ Drawer
    _scaffoldKey.currentState?.closeEndDrawer();

    // إرسال Event للـ Bloc
    context.read<AiChatBloc>().add(
      OpenConversationEvent(conversationId: conversationId),
    );
  }

  // بدء محادثة جديدة
  void _startNewChat() {
    context.read<AiChatBloc>().add(StartNewChatEvent());

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
    
      backgroundColor: AppColors.offWhite,
    
      // Drawer من اليمين
      endDrawer: ConversationsDrawer(
        onBack: () {
          _scaffoldKey.currentState?.closeEndDrawer();
        },
    
        onNewChat: () {
          _scaffoldKey.currentState?.closeEndDrawer();
    
          context.read<AiChatBloc>().add(StartNewChatEvent());
    
          _messageController.clear();
        },
    
        onConversationSelected: (conversationId) {
          _openConversation(conversationId);
        },
      ),
    
      body: SafeArea(
        child: Column(
          children: [
            // =========================
            // Header
            // =========================
            ChatHeader(
              onNewChat: _startNewChat,
    
              onShowConversations: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
    
            // =========================
            // Messages
            // =========================
            Expanded(
              child: BlocBuilder<AiChatBloc, AiChatState>(
                builder: (context, state) {
                  // محادثة جديدة
                  if (state is AiChatInitial) {
                    return EmptyChatView(
                      onSuggestionSelected: (suggestion) {
                        context.read<AiChatBloc>().add(
                          SendQuestionEvent(question: suggestion),
                        );
                      },
                    );
                  }
    
                  // جاري تحميل الرد
                  if (state is AiChatLoading) {
                    return ChatMessagesView(
                      messages: state.messages,
                      isTyping: true,
                    );
                  }
    
                  // الرسائل محملة
                  if (state is AiChatLoaded) {
                    return ChatMessagesView(messages: state.messages);
                  }
    
                  // حصل خطأ
                  if (state is AiChatError) {
                    return ChatMessagesView(messages: state.messages);
                  }
    
                  return const SizedBox();
                },
              ),
            ),
    
            // =========================
            // Input
            // =========================
            ChatInputField(
              controller: _messageController,
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
