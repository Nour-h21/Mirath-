import '../entities/one_book_page_entity.dart';
import '../repositories/one_book_page_repository.dart';

class GetBookDetailsUseCase {

  final BookDetailsRepository
      repository;

  GetBookDetailsUseCase(
    this.repository,
  );

  Future<BookDetailsEntity>
      call(int id) async {

    return await repository
        .getBookDetails(id);
  }
}