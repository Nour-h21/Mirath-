import '../entities/library_book_entity.dart';
import '../repositories/awards_repository.dart';

class GetLibraryBooksUseCase {
  final AwardsRepository repository;

  GetLibraryBooksUseCase(this.repository);

  Future<List<LibraryBookEntity>> call() {
    return repository.getLibraryBooks();
  }
}