import '../entities/books_page_entity.dart';
import '../repositories/books_page_repository.dart';

class GetBooksUseCase {
  final BooksRepository repository;

  GetBooksUseCase(this.repository);

  Future<BooksEntity> call(int id) async {
    return await repository.getBooks(id);
  }
}
