import '../entities/open_question_entity.dart';
import '../repositories/open_question_repository.dart';

class GetOpenQuestionsUseCase {
  final OpenQuestionRepository repository;

  GetOpenQuestionsUseCase(this.repository);

  Future<List<OpenQuestionEntity>> call(int chapterId) {
    return repository.getOpenQuestions(chapterId);
  }
}