import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/page/In_background_page.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/shared/widgets/dialogs/app_alert_dialog.dart';
import '../bloc/automated_quiz_page_bloc.dart';
import '../bloc/automated_quiz_page_event.dart';
import '../bloc/automated_quiz_page_state.dart';
import '../widgets/quiz_answerCard.dart';
import '../widgets/quiz_explanation.dart';
import '../widgets/quiz_progressSection.dart';
import '../widgets/quiz_questionCard.dart';
import '../widgets/quiz_timer.dart';

class AutomatedQuizPage extends StatefulWidget {
  final int chapterId;
  const AutomatedQuizPage({super.key, required this.chapterId});

  @override
  State<AutomatedQuizPage> createState() => _AutomatedQuizPageState();
}

class _AutomatedQuizPageState extends State<AutomatedQuizPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      context.read<QuizBloc>().add(const EndQuizEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizFinished) {
          final result = state.result;

          if (!result.success) {
            GoRouter.of(
              context,
            ).pushReplacement('/FailingQuizResult', extra: result);
          }
          if (result.newPoints == 3 && result.success) {
            GoRouter.of(
              context,
            ).pushReplacement('/HightQuizResultWithPoint', extra: result);
          }
          if (result.newPoints == 0 && result.success) {
            GoRouter.of(
              context,
            ).pushReplacement('/HightQuizResult', extra: result);
          }
          if (result.newPoints == 0 &&
              result.success &&
              result.percentage < 90) {
            GoRouter.of(
              context,
            ).pushReplacement('/MiddelQuizResult', extra: result);
          }
        }
        if (state is QuizError) {
          if (state.message.contains("already passed")) {
            AppAlertDialog.show(
              context: context,
              message: "لقد اجتزت هذا الاختبار مسبقاً، ولا يمكنك إعادته.",
              onPressed: () {
                Navigator.pop(context);
                GoRouter.of(context).pop();
              },
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,

        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            context.read<QuizBloc>().add(const EndQuizEvent());
          },
          child: InBackgroundPage(
            labelAppBar: "الاختبار المؤتمت",

            onBackPressed: () {
              context.read<QuizBloc>().add(const EndQuizEvent());
            },

            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                if (state is QuizLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }

                if (state is QuizQuestionState) {
                  debugPrint(
                    'showAnswer=${state.showAnswer} '
                    'selected=${state.selectedChoiceId} '
                    'correct=${state.correctChoiceId} '
                    'question=${state.currentQuestion.id}',
                  );

                  return _quizContent(context, state);
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget _quizContent(BuildContext context, QuizQuestionState state) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: context.w(4)),
    child: SizedBox(
      height: context.h(90),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: context.h(7)),
          QuizProgressSection(
            currentQuestion: state.answeredQuestions,
            totalQuestions: state.totalQuestions,
          ),

          SizedBox(height: context.h(1.5)),

          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              QuizQuestionCard(question: state.currentQuestion.questionText),
              Padding(
                padding: EdgeInsets.only(bottom: context.h(18)),
                child: QuizTimerWidget(
                  remainingTime: state.remainingTime,
                  isWarning: state.remainingTime.inSeconds <= 120,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.h(35),
            child: ListView.builder(
              itemCount: state.currentQuestion.choices.length,

              itemBuilder: (context, index) {
                final choice = state.currentQuestion.choices[index];
                return QuizAnswerCard(
                  text: choice.text,
                  isSelected: state.selectedChoiceId == choice.id,
                  // isCorrect: state.correctChoiceId == choice.id,
                  isCorrect: state.correctChoiceId != null
                      ? state.correctChoiceId == choice.id
                      : (state.isCorrect &&
                            state.selectedChoiceId == choice.id),
                  showResult: state.showAnswer,
                  onTap: state.showAnswer
                      ? () {}
                      : () {
                          context.read<QuizBloc>().add(
                            SubmitAnswerEvent(choice.id),
                          );
                        },
                );
              },
            ),
          ),

          // SizedBox(height: context.h(0.5)),
          if (state.showAnswer && state.explanation != null)
            QuizExplanationCard(explanation: state.explanation!),

          if (state.showAnswer)
            AuthButton(
              text: "متابعة",
              width: context.w(60),
              height: context.h(6),
              onPressed: () {
                context.read<QuizBloc>().add(const ContinueQuizEvent());
              },
              textStyle: AppTextStyles.authbuttonStyle(context),
            ).paddingSymetricH(context, 18),

          SizedBox(height: context.h(3)),
        ],
      ),
    ),
  );
}
