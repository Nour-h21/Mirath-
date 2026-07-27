import '../repositories/create_summary_page_repository.dart';

class AddSummaryUseCase {

  final CreateSummaryRepository repository;

  AddSummaryUseCase(this.repository);

  Future<String> call({
    required int chapterId,
    required String title,
    required String content,
  }) {

    return repository.addSummary(
      chapterId: chapterId,
      title: title,
      content: content,
    );
  }
}