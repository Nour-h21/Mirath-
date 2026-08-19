import '../../domain/entities/submit_answer_entity.dart';
import 'question_model.dart';
import 'quiz_result_model.dart';

// class SubmitAnswerModel extends SubmitAnswerEntity {
//   SubmitAnswerModel({
//     required super.isCorrect,
//     required super.answeredQuestions,
//     required super.remainingQuestions,
//     required super.selectedChoiceId,
//     super.correctChoiceId,
//     super.explanation,
//     super.nextQuestion,
//     super.quizResult,
//   });

//   factory SubmitAnswerModel.fromJson(Map<String, dynamic> json) {

//     /// انتهى الاختبار
//     if (json.containsKey("success")) {

//       return SubmitAnswerModel(

//         isCorrect: true,
//         answeredQuestions: 0,
//         remainingQuestions: 0,
//         selectedChoiceId: 0,
//         quizResult: QuizResultModel.fromJson(json),

//       );
//     }

//     /// سؤال عادي

//     return SubmitAnswerModel(
//       isCorrect: json["is_correct"],
//       answeredQuestions: json["questions_answered"],
//       remainingQuestions: json["remaining_questions"],
//       selectedChoiceId: int.parse(
//         json["choice_id"].toString(),
//       ),

//       correctChoiceId: json["correct_choice_id"],
//       explanation: json["explanation"],
//       nextQuestion: QuestionModel.fromJson(
//         json["next_question"],
//       ),
//     );
//   }
// }

class SubmitAnswerModel extends SubmitAnswerEntity {
  SubmitAnswerModel({
    required super.isCorrect,
    required super.answeredQuestions,
    required super.remainingQuestions,
    required super.selectedChoiceId,
    super.correctChoiceId,
    super.explanation,
    super.nextQuestion,
    super.quizResult,
  });

  factory SubmitAnswerModel.fromJson(Map<String, dynamic> json) {
    // آخر سؤال في الاختبار
    if (json["remaining_questions"] == 0 &&
        json["quiz_result"] != null) {
      return SubmitAnswerModel(
        isCorrect: json["is_correct"] ?? false,
        answeredQuestions: json["questions_answered"] ?? 0,
        remainingQuestions: 0,
        selectedChoiceId: int.tryParse(
              json["choice_id"]?.toString() ?? "0",
            ) ??
            0,
        correctChoiceId: json["correct_choice_id"],
        explanation: json["explanation"],
        nextQuestion: null,
        quizResult: QuizResultModel.fromJson(
          json["quiz_result"] as Map<String, dynamic>,
        ),
      );
    }

    // سؤال عادي
    return SubmitAnswerModel(
      isCorrect: json["is_correct"] ?? false,
      answeredQuestions: json["questions_answered"] ?? 0,
      remainingQuestions: json["remaining_questions"] ?? 0,
      selectedChoiceId: int.tryParse(
            json["choice_id"]?.toString() ?? "0",
          ) ??
          0,
      correctChoiceId: json["correct_choice_id"],
      explanation: json["explanation"],
      nextQuestion: json["next_question"] != null
          ? QuestionModel.fromJson(
              json["next_question"] as Map<String, dynamic>,
            )
          : null,
      quizResult: null,
    );
  }
}