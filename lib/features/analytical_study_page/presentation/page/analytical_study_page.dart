import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/page/In_background_page.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../bloc/analytical_study_page_bloc.dart';
import '../bloc/analytical_study_page_event.dart';
import '../bloc/analytical_study_page_state.dart';
import '../widgets/Analytical_progress.dart';
import '../widgets/analytical_answerCard.dart';
import '../widgets/analytical_questionCard.dart';

class AnalyticalStudyPage extends StatelessWidget {
  const AnalyticalStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: "الدراسة التحليلية",
        onBackPressed: () {
          GoRouter.of(context).pop();
        },
        child: BlocBuilder<AnalyticalBloc, AnalyticalState>(
          builder: (context, state) {
            if (state is AnalyticalLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AnalyticalError) {
              return Center(child: Text(state.message));
            }

            if (state is AnalyticalLoaded) {
              final currentQuestion = state.currentQuestion;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: context.w(4)),
                child: SizedBox(
                  height: context.h(90),
                  child: Column(
                    children: [
                      SizedBox(height: context.h(7)),

                      AnalyticalProgress(
                        currentQuestion: state.currentIndex + 1,
                        totalQuestions: state.questions.length,
                      ),

                      SizedBox(height: context.h(1)),

                      AnalyticalQuestionCard(
                        question: currentQuestion.questionText,
                      ),

                      SizedBox(
                        width: context.w(75),
                        height: context.h(6),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AnalyticalBloc>().add(
                              const ToggleAnswerEvent(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColors.baieg,
                            shadowColor: AppColors.deepPrimaryColor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            state.showAnswer
                                ? "إخفاء الإجابة"
                                : "فكّر أولاً ثم اعرض الإجابة",
                            style: AppTextStyles.authbuttonStyle(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),

                      SizedBox(height: context.h(2)),

                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        crossFadeState: state.showAnswer
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: const SizedBox(),
                        secondChild: AnalyticalAnswercard(
                          answer: currentQuestion.answer,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (state.currentIndex > 0)
                            AuthButton(
                              text: "السابق",
                              onPressed: () {
                                context.read<AnalyticalBloc>().add(
                                  const PreviousQuestionEvent(),
                                );
                              },
                              height: context.h(6),
                              textStyle: AppTextStyles.authbuttonStyle(context),
                              width: context.w(41.5),
                            ),

                          if (state.currentIndex > 0)
                            SizedBox(width: context.w(3)),

                          if (state.currentIndex < state.questions.length - 1)
                            AuthButton(
                              text: "التالي",
                              onPressed: () {
                                context.read<AnalyticalBloc>().add(
                                  const NextQuestionEvent(),
                                );
                              },
                              height: context.h(6),
                              textStyle: AppTextStyles.authbuttonStyle(context),
                              width: context.w(41.5),
                            ),
                        ],
                      ),

                      SizedBox(height: context.h(5)),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
