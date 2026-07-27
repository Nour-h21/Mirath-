import 'package:mirath/core/core.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.only(
          bottom: context.h(2),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.w(4),
          vertical: context.h(1.5),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
  context.w(4),
),
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
              'يكتب الآن...',
              style: TextStyle(
                color: AppColors.black.withOpacity(0.5),
                fontSize: context.sp(2.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}