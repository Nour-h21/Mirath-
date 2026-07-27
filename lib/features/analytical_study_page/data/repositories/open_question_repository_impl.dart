import '../../domain/entities/open_question_entity.dart';
import '../../domain/repositories/open_question_repository.dart';
import '../datasources/open_question_remote_ds.dart';

class OpenQuestionRepositoryImpl
    implements OpenQuestionRepository {

  final OpenQuestionRemoteDataSource remoteDataSource;

  OpenQuestionRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  Future<List<OpenQuestionEntity>> getOpenQuestions(
      int chapterId) {
    return remoteDataSource.getOpenQuestions(chapterId);
  }
}