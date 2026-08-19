abstract class FeedbackRepository {
  Future<String> addFeedback({
    required String feedback,
  });
}