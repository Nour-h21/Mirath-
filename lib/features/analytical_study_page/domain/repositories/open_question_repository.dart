import '../entities/open_question_entity.dart';

abstract class OpenQuestionRepository {
  Future<List<OpenQuestionEntity>> getOpenQuestions(int chapterId);
}