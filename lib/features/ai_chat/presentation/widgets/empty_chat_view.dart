import 'package:mirath/core/core.dart';

class EmptyChatView extends StatelessWidget {
  final ValueChanged<String>? onSuggestionSelected;

  const EmptyChatView({
    super.key,
    this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.w(20),
              height: context.w(20),
              decoration: BoxDecoration(
                color: AppColors.baieg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.primaryColor,
                size: context.sp(10),
              ),
            ),

            SizedBox(
              height: context.h(3),
            ),

            Text(
              'مرحباً بك في مساعد ميراث',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: context.sp(5),
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(
              height: context.h(1.5),
            ),

            Text(
              'اسألني عن أي موضوع دراسي، وسأساعدك في فهمه والبحث عن الإجابة المناسبة من مصادر المعرفة.',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.55),
                fontSize: context.sp(3.3),
                height: 1.7,
              ),
            ),

            SizedBox(
              height: context.h(3),
            ),

            Wrap(
              spacing: context.w(2),
              runSpacing: context.h(1),
              alignment: WrapAlignment.center,
              children: [
                _SuggestionChip(
                  text: 'اشرح لي هذا الموضوع',
                  onTap: onSuggestionSelected,
                ),
                _SuggestionChip(
                  text: 'لخص لي الدرس',
                  onTap: onSuggestionSelected,
                ),
                _SuggestionChip(
                  text: 'اختبرني',
                  onTap: onSuggestionSelected,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String text;
  final ValueChanged<String>? onTap;

  const _SuggestionChip({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(text),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(3.5),
          vertical: context.h(1),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
  context.w(5),
),
          border: Border.all(
            color: AppColors.offPink.withOpacity(0.7),
          ),
        ),
        child: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: context.sp(2.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}