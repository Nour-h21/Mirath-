import '../../domain/entities/question_entity.dart';
import '../../domain/entities/quiz_result_entity.dart';


const _noChange = Object();

abstract class QuizState {
  const QuizState();
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizError extends QuizState {
  final String message;

  const QuizError(this.message);
}

// class QuizQuestionState extends QuizState {
//   final int sessionId;
//   final int totalQuestions;
//   final int answeredQuestions;
//   final int remainingQuestions;
//   final Duration remainingTime;
//   final QuestionEntity currentQuestion;

//   /// السؤال القادم الذي يرجع من submitAnswer
//   final QuestionEntity? nextQuestion;

//   final bool showAnswer;
//   final bool isCorrect;

//   final int? selectedChoiceId;
//   final int? correctChoiceId;

//   final String? explanation;

//   const QuizQuestionState({
//     required this.sessionId,
//     required this.totalQuestions,
//     required this.answeredQuestions,
//     required this.remainingQuestions,
//     required this.remainingTime,
//     required this.currentQuestion,
//     this.nextQuestion,
//     this.showAnswer = false,
//     this.isCorrect = false,
//     this.selectedChoiceId,
//     this.correctChoiceId,
//     this.explanation,
//   });

//   QuizQuestionState copyWith({
//     int? sessionId,
//     int? totalQuestions,
//     int? answeredQuestions,
//     int? remainingQuestions,
//     Duration? remainingTime,
//     QuestionEntity? currentQuestion,

//     Object? nextQuestion = _noChange,

//     bool? showAnswer,
//     bool? isCorrect,

//     Object? selectedChoiceId = _noChange,
//     Object? correctChoiceId = _noChange,
//     Object? explanation = _noChange,
//   }) {
//     return QuizQuestionState(
//       sessionId: sessionId ?? this.sessionId,
//       totalQuestions: totalQuestions ?? this.totalQuestions,
//       answeredQuestions: answeredQuestions ?? this.answeredQuestions,
//       remainingQuestions: remainingQuestions ?? this.remainingQuestions,
//       remainingTime: remainingTime ?? this.remainingTime,
//       currentQuestion: currentQuestion ?? this.currentQuestion,

//       nextQuestion: nextQuestion == _noChange
//           ? this.nextQuestion
//           : nextQuestion as QuestionEntity?,

//       showAnswer: showAnswer ?? this.showAnswer,
//       isCorrect: isCorrect ?? this.isCorrect,

//       selectedChoiceId: selectedChoiceId == _noChange
//           ? this.selectedChoiceId
//           : selectedChoiceId as int?,

//       correctChoiceId: correctChoiceId == _noChange
//           ? this.correctChoiceId
//           : correctChoiceId as int?,

//       explanation: explanation == _noChange
//           ? this.explanation
//           : explanation as String?,
//     );
//   }
// }


class QuizFinished extends QuizState {
  final QuizResultEntity result;

  const QuizFinished(this.result);
}
class QuizQuestionState extends QuizState {
  final int sessionId;
  final int totalQuestions;
  final int answeredQuestions;
  final int remainingQuestions;
  final Duration remainingTime;
  final QuestionEntity currentQuestion;

  final QuestionEntity? nextQuestion;

  final bool showAnswer;
  final bool isCorrect;

  final int? selectedChoiceId;
  final int? correctChoiceId;
  final String? explanation;

  // نتيجة الاختبار إذا كان هذا آخر سؤال
  final QuizResultEntity? quizResult;

  const QuizQuestionState({
    required this.sessionId,
    required this.totalQuestions,
    required this.answeredQuestions,
    required this.remainingQuestions,
    required this.remainingTime,
    required this.currentQuestion,
    this.nextQuestion,
    this.showAnswer = false,
    this.isCorrect = false,
    this.selectedChoiceId,
    this.correctChoiceId,
    this.explanation,
    this.quizResult,
  });
QuizQuestionState copyWith({
  int? sessionId,
  int? totalQuestions,
  int? answeredQuestions,
  int? remainingQuestions,
  Duration? remainingTime,
  QuestionEntity? currentQuestion,
  Object? nextQuestion = _noChange,
  bool? showAnswer,
  bool? isCorrect,
  Object? selectedChoiceId = _noChange,
  Object? correctChoiceId = _noChange,
  Object? explanation = _noChange,
  Object? quizResult = _noChange,
}) {
  return QuizQuestionState(
    sessionId: sessionId ?? this.sessionId,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    answeredQuestions: answeredQuestions ?? this.answeredQuestions,
    remainingQuestions: remainingQuestions ?? this.remainingQuestions,
    remainingTime: remainingTime ?? this.remainingTime,
    currentQuestion: currentQuestion ?? this.currentQuestion,

    nextQuestion: nextQuestion == _noChange
        ? this.nextQuestion
        : nextQuestion as QuestionEntity?,

    showAnswer: showAnswer ?? this.showAnswer,
    isCorrect: isCorrect ?? this.isCorrect,

    selectedChoiceId: selectedChoiceId == _noChange
        ? this.selectedChoiceId
        : selectedChoiceId as int?,

    correctChoiceId: correctChoiceId == _noChange
        ? this.correctChoiceId
        : correctChoiceId as int?,

    explanation: explanation == _noChange
        ? this.explanation
        : explanation as String?,

    quizResult: quizResult == _noChange
        ? this.quizResult
        : quizResult as QuizResultEntity?,
  );
  
}

}