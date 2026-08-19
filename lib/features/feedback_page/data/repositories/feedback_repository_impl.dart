import '../../domain/repositories/feedback_repository.dart';
import '../datasources/feedback_remote_ds.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final FeedbackRemoteDataSource remoteDataSource;

  FeedbackRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> addFeedback({
    required String feedback,
  }) async {
    return await remoteDataSource.addFeedback(
      feedback: feedback,
    );
  }
}