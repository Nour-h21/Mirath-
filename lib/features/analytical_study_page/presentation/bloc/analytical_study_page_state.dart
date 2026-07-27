import '../../domain/entities/open_question_entity.dart';

abstract class AnalyticalState {
  const AnalyticalState();
}

class AnalyticalInitial extends AnalyticalState {}

class AnalyticalLoading extends AnalyticalState {}

class AnalyticalError extends AnalyticalState {
  final String message;

  const AnalyticalError(this.message);
}

class AnalyticalLoaded extends AnalyticalState {
  final List<OpenQuestionEntity> questions;

  final int currentIndex;

  final bool showAnswer;

  const AnalyticalLoaded({
    required this.questions,
    required this.currentIndex,
    required this.showAnswer,
  });

  OpenQuestionEntity get currentQuestion =>
      questions[currentIndex];

  AnalyticalLoaded copyWith({
    List<OpenQuestionEntity>? questions,
    int? currentIndex,
    bool? showAnswer,
  }) {
    return AnalyticalLoaded(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      showAnswer: showAnswer ?? this.showAnswer,
    );
  }
}