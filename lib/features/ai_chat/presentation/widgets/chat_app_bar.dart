import 'package:mirath/core/core.dart';

class ChatHeader extends StatelessWidget {
  final VoidCallback onNewChat;
  final VoidCallback onShowConversations;

  const ChatHeader({
    super.key,
    required this.onNewChat,
    required this.onShowConversations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingSymmetric(1.5, 4),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey.withOpacity(0.35),
            width: 0.7,
          ),
        ),
      ),
      child: Row(
        children: [
          _HeaderIconButton(
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          SizedBox(width: context.w(3)),

          Container(
            width: context.w(11),
            height: context.w(11),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(context.w(3)),
            ),
            child: Icon(
              Icons.auto_awesome_rounded,
              color: Colors.white,
              size: context.sp(5),
            ),
          ),

          SizedBox(width: context.w(3)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مساعد ميراث',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: context.sp(4.2),
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: context.h(0.3)),

                Row(
                  children: [
                    Container(
                      width: context.w(1.8),
                      height: context.w(1.8),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: context.w(1.5)),

                    Text(
                      'مساعدك الدراسي الذكي',
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.55),
                        fontSize: context.sp(2.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          _HeaderIconButton(
            icon: Icons.add_comment_outlined,
            onPressed: onNewChat,
          ),

          _HeaderIconButton(
            icon: Icons.history_rounded,
            onPressed: onShowConversations,
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: context.w(5),
      icon: Icon(icon, color: AppColors.primaryColor, size: context.sp(5.5)),
    );
  }
}
