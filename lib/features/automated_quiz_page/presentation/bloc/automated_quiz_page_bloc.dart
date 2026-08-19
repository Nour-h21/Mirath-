import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/end_quiz_usecase.dart';
import '../../domain/usecase/start_quiz_usecase.dart';
import '../../domain/usecase/submit_answer_usecase.dart';
import 'automated_quiz_page_event.dart';
import 'automated_quiz_page_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final StartQuizUseCase startQuizUseCase;
  final SubmitAnswerUseCase submitAnswerUseCase;
  final EndQuizUseCase endQuizUseCase;
  bool isSubmittingAnswer = false;

  Timer? _timer;
  QuizBloc(this.startQuizUseCase, this.submitAnswerUseCase, this.endQuizUseCase)
    : super(QuizInitial()) {
    on<StartQuizEvent>(_startQuiz);

    on<SubmitAnswerEvent>(_submitAnswer);

    on<ContinueQuizEvent>(_continueQuestion);

    on<EndQuizEvent>(_endQuiz);

    on<TickTimerEvent>(_tickTimer);

    on<TimeFinishedEvent>(_timeFinished);
  }
  Future<void> _startQuiz(StartQuizEvent event, Emitter<QuizState> emit) async {
    emit(QuizLoading());

    try {
      final session = await startQuizUseCase(event.chapterId);

      emit(
        QuizQuestionState(
          sessionId: session.sessionId,
          totalQuestions: session.totalQuestions,
          answeredQuestions: 1,
          remainingQuestions: session.totalQuestions - 1,
          remainingTime: Duration(seconds: session.estimatedDuration),
          currentQuestion: session.firstQuestion,
        ),
      );

      _startTimer();
    } on DioException catch (e) {
      emit(QuizError(e.response?.data["message"] ?? "حدث خطأ"));
    }
  }

  void _startTimer() {
    final current = state as QuizQuestionState;

    debugPrint(
      "tick showAnswer=${current.showAnswer} "
      "selected=${current.selectedChoiceId}",
    );
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const TickTimerEvent());
    });
  }

  void _tickTimer(TickTimerEvent event, Emitter<QuizState> emit) {
    if (state is! QuizQuestionState) return;

    final current = state as QuizQuestionState;

    if (current.remainingTime.inSeconds <= 1) {
      _timer?.cancel();

      add(const TimeFinishedEvent());

      return;
    }

    emit(
      current.copyWith(
        remainingTime: current.remainingTime - const Duration(seconds: 1),
      ),
    );
  }

  Future<void> _timeFinished(
    TimeFinishedEvent event,
    Emitter<QuizState> emit,
  ) async {
    add(const EndQuizEvent());
  }

  // Future<void> _submitAnswer(
  //   SubmitAnswerEvent event,
  //   Emitter<QuizState> emit,
  // ) async {
  //   if (state is! QuizQuestionState) return;

  //   final currentState = state as QuizQuestionState;

  //   // منع إرسال إجابة ثانية لنفس السؤال
  //   if (currentState.showAnswer) {
  //     return;
  //   }

  //   try {
  //     final response = await submitAnswerUseCase(
  //       sessionId: currentState.sessionId,
  //       questionId: currentState.currentQuestion.id,
  //       choiceId: event.choiceId,
  //     );

  //     /*
  //     الحالة الأولى:
  //     الاختبار انتهى
  //     الباك رجع QuizResult
  //   */

  //     if (response.quizResult != null) {
  //       _timer?.cancel();

  //       emit(QuizFinished(response.quizResult!));

  //       return;
  //     }

  //     /*
  //     الحالة الثانية:
  //     يوجد سؤال جديد
  //   */

  //     emit(
  //       currentState.copyWith(
  //         showAnswer: true,
  //         selectedChoiceId: response.selectedChoiceId,
  //         correctChoiceId: response.correctChoiceId,
  //         isCorrect: response.isCorrect,
  //         explanation: response.explanation,
  //         nextQuestion: response.nextQuestion,
  //         answeredQuestions: response.answeredQuestions,
  //         remainingQuestions: response.remainingQuestions,
  //       ),
  //     );
  //     /////
  //     debugPrint("submit emitted");
  //     debugPrint("selected = ${response.selectedChoiceId}");
  //     debugPrint("correct = ${response.correctChoiceId}");
  //     debugPrint("explanation = ${response.explanation}");
  //     debugPrint("nextQuestion = ${response.nextQuestion?.id}");
  //     debugPrint("quizResult = ${response.quizResult}");
  //     /////
  //   } on DioException catch (e) {
  //     emit(
  //       QuizError(e.response?.data["message"] ?? "حدث خطأ أثناء إرسال الإجابة"),
  //     );
  //   }
  // }

  /////
  Future<void> _submitAnswer(
    SubmitAnswerEvent event,
    Emitter<QuizState> emit,
  ) async {
    if (state is! QuizQuestionState) return;

    final currentState = state as QuizQuestionState;

    // منع الضغط المزدوج أو الضغط بإصبعين
    if (isSubmittingAnswer) {
      return;
    }

    // منع إرسال إجابة بعد إظهار النتيجة
    if (currentState.showAnswer) {
      return;
    }

    isSubmittingAnswer = true;

    try {
      final response = await submitAnswerUseCase(
        sessionId: currentState.sessionId,
        questionId: currentState.currentQuestion.id,
        choiceId: event.choiceId,
      );

      // آخر سؤال
      // if (response.quizResult != null) {
      //   _timer?.cancel();

      //   isSubmittingAnswer = false;

      //   emit(
      //     QuizFinished(response.quizResult!),
      //   );

      //   return;
      // }
      if (response.quizResult != null) {
        _timer?.cancel();

        emit(
          currentState.copyWith(
            showAnswer: true,

            selectedChoiceId: response.selectedChoiceId,
            correctChoiceId: response.correctChoiceId,
            isCorrect: response.isCorrect,
            explanation: response.explanation,

            answeredQuestions: response.answeredQuestions,
            remainingQuestions: response.remainingQuestions,

            nextQuestion: null,

            // نخزن النتيجة، لكن لا نعرضها الآن
            quizResult: response.quizResult,
          ),
        );

        return;
      }
      // سؤال عادي
      isSubmittingAnswer = false;

      emit(
        currentState.copyWith(
          showAnswer: true,
          selectedChoiceId: response.selectedChoiceId,
          correctChoiceId: response.correctChoiceId,
          isCorrect: response.isCorrect,
          explanation: response.explanation,
          nextQuestion: response.nextQuestion,
          answeredQuestions: response.answeredQuestions,
          remainingQuestions: response.remainingQuestions,
        ),
      );
    } on DioException catch (e) {
      isSubmittingAnswer = false;

      emit(
        QuizError(e.response?.data["message"] ?? "حدث خطأ أثناء إرسال الإجابة"),
      );
    }
  }
  /////

  // void _continueQuestion(ContinueQuizEvent event, Emitter<QuizState> emit) {
  //   if (state is! QuizQuestionState) return;

  //   final currentState = state as QuizQuestionState;

  //   if (currentState.nextQuestion == null) {
  //     return;
  //   }

  //   emit(
  //     currentState.copyWith(
  //       currentQuestion: currentState.nextQuestion,
  //       nextQuestion: null,
  //       showAnswer: false,
  //       selectedChoiceId: null,
  //       correctChoiceId: null,
  //       explanation: null,
  //     ),
  //   );
  // }

  void _continueQuestion(ContinueQuizEvent event, Emitter<QuizState> emit) {
    if (state is! QuizQuestionState) return;

    final currentState = state as QuizQuestionState;

    // آخر سؤال
    if (currentState.quizResult != null) {
      _timer?.cancel();

      emit(QuizFinished(currentState.quizResult!));

      return;
    }

    // سؤال عادي ويوجد سؤال قادم
    if (currentState.nextQuestion == null) {
      return;
    }

    emit(
      currentState.copyWith(
        currentQuestion: currentState.nextQuestion,

        nextQuestion: null,

        showAnswer: false,

        selectedChoiceId: null,
        correctChoiceId: null,
        explanation: null,

        quizResult: null,
      ),
    );
  }

  Future<void> _endQuiz(EndQuizEvent event, Emitter<QuizState> emit) async {
    if (state is! QuizQuestionState) return;

    final currentState = state as QuizQuestionState;

    _timer?.cancel();

    try {
      final result = await endQuizUseCase(currentState.sessionId);

      emit(QuizFinished(result));
    } on DioException catch (e) {
      emit(QuizError(e.response?.data["message"] ?? "حدث خطأ"));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();

    return super.close();
  }
}
