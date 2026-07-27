
import 'package:mirath/core/core.dart';

class ConversationsHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNewChat;

  const ConversationsHeader({
    super.key,
    required this.onBack,
    required this.onNewChat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingSymmetric(
        1.5,
        4,
      ),
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
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: AppColors.black,
                fontSize: context.sp(5),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          GestureDetector(
            onTap: onNewChat,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(3),
                vertical: context.h(1),
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(
                  context.w(3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: context.sp(5),
                  ),

                  SizedBox(
                    width: context.w(1),
                  ),

                  Text(
                    'جديدة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.sp(3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}