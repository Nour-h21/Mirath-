import '../entities/books_page_entity.dart';

abstract class BooksRepository {
  Future<BooksEntity> getBooks(int id);
}
