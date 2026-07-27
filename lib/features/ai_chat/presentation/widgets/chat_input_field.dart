import 'package:mirath/core/core.dart';


class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.h(1),
        bottom: context.h(1.5),
        left: context.w(4),
        right: context.w(4),
      ),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 4,
              textDirection: TextDirection.rtl,
              textInputAction: TextInputAction.newline,
              style: TextStyle(
                color: AppColors.black,
                fontSize: context.sp(3.5),
              ),
              decoration: InputDecoration(
                hintText: 'اكتب سؤالك هنا...',
                hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(
                  color: AppColors.black.withOpacity(0.4),
                  fontSize: context.sp(3.3),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.w(4),
                  vertical: context.h(1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
  context.w(5),
),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          SizedBox(
            width: context.w(2),
          ),

          GestureDetector(
            onTap: onSend,
            child: Container(
              width: context.w(12),
              height: context.w(12),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(
  context.w(4),
),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: context.sp(5.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}