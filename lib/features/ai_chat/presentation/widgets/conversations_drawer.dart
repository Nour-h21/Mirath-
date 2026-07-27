import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mirath/app/routes/router.dart';
import 'package:mirath/core/core.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

import '../../data/models/chat_model.dart';
import '../bloc/ai_chat_bloc.dart';
import '../bloc/ai_chat_event.dart';
import '../bloc/ai_chat_state.dart';

class ConversationsDrawer extends StatelessWidget {
  final ValueChanged<int> onConversationSelected;
  final VoidCallback onBack;
  final VoidCallback onNewChat;

  const ConversationsDrawer({
    super.key,
    required this.onConversationSelected,
    required this.onBack,
    required this.onNewChat,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w(82),
      child: Drawer(
        backgroundColor: AppColors.offWhite,
        child: BlocProvider(
          create: (_) =>
              GetIt.instance<AiChatBloc>(
                param1: null,
              )..add(
                  GetChatsEvent(),
                ),
          child: _ConversationsDrawerContent(
            onConversationSelected:
                onConversationSelected,
            onBack: onBack,
            onNewChat: onNewChat,
          ),
        ),
      ),
    );
  }
}

class _ConversationsDrawerContent
    extends StatefulWidget {
  final ValueChanged<int>
      onConversationSelected;

  final VoidCallback onBack;

  final VoidCallback onNewChat;

  const _ConversationsDrawerContent({
    required this.onConversationSelected,
    required this.onBack,
    required this.onNewChat,
  });

  @override
  State<_ConversationsDrawerContent>
      createState() =>
          _ConversationsDrawerContentState();
}
class _ConversationsDrawerContentState
    extends State<_ConversationsDrawerContent> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(
  context,
  widget.onBack,
),
          SizedBox(height: context.h(2)),
          GestureDetector(
  onTap: widget.onNewChat,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(3),
                vertical: context.h(2),
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(context.w(3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: context.sp(5),
                  ),

                  SizedBox(width: context.w(1)),

                  Text(
                    'ابدأ محادثة جديدة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.sp(3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ).paddingOnly(context, 2, 2, 0, 0),
          ),

          // _buildSearchField(context),
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
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.w(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: context.w(22),
                              height: context.w(22),
                              decoration: BoxDecoration(
                                color: AppColors.baieg,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.forum_outlined,
                                color: AppColors.primaryColor,
                                size: context.sp(11),
                              ),
                            ),

                            SizedBox(height: context.h(3)),

                            Text(
                              'لا توجد محادثات بعد',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: context.sp(5),
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: context.h(1.5)),

                            Text(
                              'ابدأ محادثة جديدة مع مساعد ميراث للحصول على المساعدة والإجابات التي تحتاجها.',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.55),
                                fontSize: context.sp(3.3),
                                height: 1.7,
                              ),
                            ),

                            SizedBox(height: context.h(3)),

                            //
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: context.w(3)),
                    itemCount: _filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = _filteredChats[index];

                      return _ConversationTile(
                        chat: chat,
                        onTap: () {
                          widget.onConversationSelected(chat.id);
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
    );
  }
}

class _ConversationTile extends StatelessWidget {
  final ChatModel chat;

  final VoidCallback onTap;

  const _ConversationTile({required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.w(3)),
      child: Container(
        margin: EdgeInsets.only(bottom: context.h(1)),
        padding: EdgeInsets.symmetric(
          horizontal: context.w(3),
          vertical: context.h(1.5),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.w(3)),
        ),
        child: Row(
          children: [
            Container(
              width: context.w(11),
              height: context.w(11),
              decoration: BoxDecoration(
                color: AppColors.baieg,
                borderRadius: BorderRadius.circular(context.w(3)),
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: AppColors.primaryColor,
                size: context.sp(5),
              ),
            ),

            SizedBox(width: context.w(3)),

            Expanded(
              child: Text(
                chat.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: context.sp(3.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(
  BuildContext context,
  VoidCallback onBack,
) {
  return Container(
    padding: context.paddingSymmetric(
      1.5,
      4,
    ),
    decoration: BoxDecoration(
      color: AppColors.offWhite,
      border: Border(
        bottom: BorderSide(
          color: AppColors.grey.withOpacity(
            0.35,
          ),
          width: 0.7,
        ),
      ),
    ),
    child: Row(
      children: [
        IconButton(
          onPressed: onBack,
          splashRadius: context.w(5),
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.primaryColor,
            size: context.sp(5),
          ),
        ),

        SizedBox(
          width: context.w(2),
        ),

        Expanded(
          child: Text(
            'محادثاتي',
            textDirection:
                TextDirection.rtl,
            style: TextStyle(
              color: AppColors.black,
              fontSize: context.sp(5),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

// Widget _buildSearchField(
//   BuildContext context,
// ) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: context.w(4),
//       vertical: context.h(1),
//     ),
//     child: TextField(
//       controller: _searchController,
//       onChanged: _searchChats,
//       textDirection: TextDirection.rtl,
//       decoration: InputDecoration(
//         hintText:
//             'ابحث في محادثاتك...',
//         hintTextDirection:
//             TextDirection.rtl,
//         prefixIcon: Icon(
//           Icons.search_rounded,
//           color:
//               AppColors.primaryColor,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         border:
//             OutlineInputBorder(
//           borderRadius:
//               BorderRadius.circular(
//             context.w(4),
//           ),
//           borderSide:
//               BorderSide.none,
//         ),
//       ),
//     ),
//   );
// }