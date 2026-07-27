
import 'package:mirath/core/core.dart';

import '../../domain/entities/chat_message_entity.dart';


class ChatMessageBubble extends StatelessWidget {
  final ChatMessageEntity message;

  const ChatMessageBubble({
    super.key,
    required this.message,
  });

  bool get isUser => message.sender == MessageSender.user;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.w(82),
        ),
        margin: EdgeInsets.only(
          bottom: context.h(2),
        ),
        child: Column(
          crossAxisAlignment: isUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (!isUser) _AssistantHeader(),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(4),
                vertical: context.h(1.6),
              ),
              decoration: BoxDecoration(
  color: isUser
      ? AppColors.primaryColor
      : Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(
      context.w(4),
    ),
    topRight: Radius.circular(
      context.w(4),
    ),
    bottomLeft: Radius.circular(
      isUser ? context.w(4) : context.w(1),
    ),
    bottomRight: Radius.circular(
      isUser ? context.w(1) : context.w(4),
    ),
  ),
  boxShadow: isUser
      ? null
      : [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
),
              child: Text(
                message.message,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: isUser
                      ? Colors.white
                      : AppColors.black,
                  fontSize: context.sp(3.5),
                  height: 1.65,
                ),
              ),
            ),

            SizedBox(
              height: context.h(0.5),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(1),
              ),
              child: Text(
                _formatTime(message.time),
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.4),
                  fontSize: context.sp(2.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'م' : 'ص';

    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }
}

class _AssistantHeader extends StatelessWidget {
  const _AssistantHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.w(2),
        bottom: context.h(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.w(7),
            height: context.w(7),
            decoration: BoxDecoration(
              color: AppColors.baieg,
              borderRadius: BorderRadius.circular(
  context.w(2),
),
            ),
            child: Icon(
              Icons.auto_awesome_rounded,
              color: AppColors.primaryColor,
              size: context.sp(4),
            ),
          ),

          SizedBox(
            width: context.w(2),
          ),

          Text(
            'مساعد ميراث',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: context.sp(2.8),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}