import '../entities/one_book_page_entity.dart';

abstract class BookDetailsRepository {

  Future<BookDetailsEntity>
      getBookDetails(
    int id,
  );
}

