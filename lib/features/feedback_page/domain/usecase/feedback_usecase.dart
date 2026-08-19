import '../repositories/feedback_repository.dart';

class AddFeedbackUseCase {
  final FeedbackRepository repository;

  AddFeedbackUseCase(this.repository);

  Future<String> call({
    required String feedback,
  }) async {
    return await repository.addFeedback(
      feedback: feedback,
    );
  }
}