abstract class CreateSummaryRepository {
  Future<String> addSummary({
    required int chapterId,
    required String title,
    required String content,
  });
}