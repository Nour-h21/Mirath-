import '../../domain/entities/add_to_cart_entity.dart';
import '../../domain/entities/library_book_entity.dart';
import '../../domain/repositories/awards_repository.dart';
import '../datasources/awards_remote_ds.dart';

class AwardsRepositoryImpl implements AwardsRepository {
  final AwardsRemoteDataSource remoteDataSource;

  AwardsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<LibraryBookEntity>> getLibraryBooks() async {
    return await remoteDataSource.getLibraryBooks();
  }

  @override
  Future<AddToCartEntity> addBookToCart(int bookId) {
    return remoteDataSource.addBookToCart(bookId);
  }
}
