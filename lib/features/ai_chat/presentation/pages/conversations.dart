import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

import '../../data/models/chat_model.dart';
import '../bloc/ai_chat_bloc.dart';
import '../bloc/ai_chat_event.dart';
import '../bloc/ai_chat_state.dart';

import '../widgets/conversation_card.dart';
import '../widgets/conversations_empty_view.dart';
import '../widgets/conversations_header.dart';

import 'ai_chat_page.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.instance<AiChatBloc>(param1: null)..add(GetChatsEvent()),
      child: const _ConversationsView(),
    );
  }
}

class _ConversationsView extends StatefulWidget {
  const _ConversationsView();

  @override
  State<_ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<_ConversationsView> {
  final TextEditingController _searchController = TextEditingController();

  List<ChatModel> _allChats = [];

  List<ChatModel> _filteredChats = [];

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  void _searchChats(String value) {
    final query = value.trim().toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredChats = List.from(_allChats);
      } else {
        _filteredChats = _allChats.where((chat) {
          return chat.title.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _openConversation(ChatModel chat) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AiChatPage(conversationId: chat.id)),
    );
  }

  void _createNewChat() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AiChatPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Column(
          children: [
            ConversationsHeader(
              onBack: () {
                Navigator.pop(context);
              },
              onNewChat: _createNewChat,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(4),
                vertical: context.h(2),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _searchChats,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'ابحث في محادثاتك...',
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.primaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: context.w(4),
                    vertical: context.h(1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.w(4)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Expanded(
              child: BlocBuilder<AiChatBloc, AiChatState>(
                builder: (context, state) {
                  if (state is ChatsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ChatsLoaded) {
                    if (_allChats.isEmpty) {
                      _allChats = state.chats;

                      _filteredChats = state.chats;
                    }

                    if (_filteredChats.isEmpty) {
                      return ConversationsEmptyView(onNewChat: _createNewChat);
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: context.w(4)),
                      itemCount: _filteredChats.length,
                      itemBuilder: (context, index) {
                        final chat = _filteredChats[index];

                        return ConversationCard(
                          chat: chat,
                          onTap: () {
                            _openConversation(chat);
                          },
                        );
                      },
                    );
                  }

                  if (state is ChatsError) {
                    return Center(
                      child: Text(
                        state.message,
                        textDirection: TextDirection.rtl,
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
