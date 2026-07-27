import '../../domain/entities/books_page_entity.dart';
import '../../domain/repositories/books_page_repository.dart';
import '../datasources/books_page_remote_ds.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksRemoteDataSource remoteDataSource;

  BooksRepositoryImpl(this.remoteDataSource);

  @override
  Future<BooksEntity> getBooks(int id) async {
    final result = await remoteDataSource.getBooks(id);

    return BooksEntity(
      bio: result.bio,

      books: result.books.map((e) {
        return BookEntity(
          id: e.id,

          title: e.title,

          authorName: e.authorName,

          photo: e.photo,
        );
      }).toList(),
    );
  }
}
