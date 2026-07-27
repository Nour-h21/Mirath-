import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../domain/usecase/open_question_usecase.dart';
import 'analytical_study_page_event.dart';
import 'analytical_study_page_state.dart';


class AnalyticalBloc
    extends Bloc<AnalyticalEvent, AnalyticalState> {

  final GetOpenQuestionsUseCase getOpenQuestionsUseCase;

  AnalyticalBloc(
    this.getOpenQuestionsUseCase,
  ) : super(AnalyticalInitial()) {

    on<LoadAnalyticalQuestionsEvent>(_loadQuestions);

    on<NextQuestionEvent>(_nextQuestion);

    on<PreviousQuestionEvent>(_previousQuestion);

    on<ToggleAnswerEvent>(_toggleAnswer);
  }

  Future<void> _loadQuestions(
    LoadAnalyticalQuestionsEvent event,
    Emitter<AnalyticalState> emit,
  ) async {

    emit(AnalyticalLoading());

    try {

      final questions =
          await getOpenQuestionsUseCase(event.chapterId);

      emit(
        AnalyticalLoaded(
          questions: questions,
          currentIndex: 0,
          showAnswer: false,
        ),
      );

    } on DioException catch (e) {

      emit(
        AnalyticalError(
          e.response?.data["message"] ??
              "حدث خطأ",
        ),
      );
    }
  }

  void _nextQuestion(
    NextQuestionEvent event,
    Emitter<AnalyticalState> emit,
  ) {

    if (state is! AnalyticalLoaded) return;

    final current = state as AnalyticalLoaded;

    if (current.currentIndex >=
        current.questions.length - 1) {
      return;
    }

    emit(
      current.copyWith(
        currentIndex: current.currentIndex + 1,
        showAnswer: false,
      ),
    );
  }

  void _previousQuestion(
    PreviousQuestionEvent event,
    Emitter<AnalyticalState> emit,
  ) {

    if (state is! AnalyticalLoaded) return;

    final current = state as AnalyticalLoaded;

    if (current.currentIndex == 0) {
      return;
    }

    emit(
      current.copyWith(
        currentIndex: current.currentIndex - 1,
        showAnswer: false,
      ),
    );
  }

  void _toggleAnswer(
    ToggleAnswerEvent event,
    Emitter<AnalyticalState> emit,
  ) {

    if (state is! AnalyticalLoaded) return;

    final current = state as AnalyticalLoaded;

    emit(
      current.copyWith(
        showAnswer: !current.showAnswer,
      ),
    );
  }
}