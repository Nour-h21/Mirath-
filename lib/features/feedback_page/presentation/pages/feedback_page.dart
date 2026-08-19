import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/core/core.dart';

import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../bloc/feedback_bloc.dart';
import '../bloc/feedback_event.dart';
import '../bloc/feedback_state.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  void _sendFeedback() {
    final feedback = feedbackController.text.trim();

    if (feedback.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى كتابة الملاحظات أولاً')),
      );
      return;
    }

    context.read<FeedbackBloc>().add(AddFeedbackEvent(feedback: feedback));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedbackBloc, FeedbackState>(
      listener: (context, state) {
        if (state is FeedbackSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message.isNotEmpty
                    ? state.message
                    : 'تم إرسال ملاحظاتك بنجاح',
              ),
              backgroundColor: Colors.green,
            ),
          );

          feedbackController.clear();

          //  GoRouter.of(context).pop();
        }

        if (state is FeedbackFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ أثناء إرسال الملاحظات'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is FeedbackLoading;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: InBackgroundPage(
            labelAppBar: 'ملاحظاتك',
            onBackPressed: () {
              GoRouter.of(context).pop();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: context.h(6)),

                Text(
                  'شاركنا رأيك',
                  style: AppTextStyles.midDeepPrimaryColorStyle(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: context.h(1)),

                Text(
                  'نحن نهتم برأيك، أخبرنا عن تجربتك واقترح علينا ما يمكن تحسينه.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.smallBlack54Style(context),
                ),

                SizedBox(height: context.h(5)),
                Expanded(
                  child: TextField(
                    controller: feedbackController,
                    maxLines: 7,
                    maxLength: 500,
                    cursorColor: AppColors.primaryColor,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'اكتب ملاحظاتك هنا...',
                      hintStyle: AppTextStyles.smallBlack54Style(context),
                      alignLabelWithHint: true,
                      filled: true,
                      fillColor: AppColors.baieg,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),

                AuthButton(
                  text: isLoading ? 'جاري الإرسال...' : 'إرسال الملاحظات',
                  onPressed: isLoading ? () {} : _sendFeedback,
                  height: context.h(6),
                  width: double.infinity,
                  textStyle: AppTextStyles.authbuttonStyle(context),
                ),
              ],
            ).paddingSymetric(context, 5, 5),
          ),
        );
      },
    );
  }
}
