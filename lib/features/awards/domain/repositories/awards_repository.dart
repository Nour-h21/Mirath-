import '../entities/add_to_cart_entity.dart';
import '../entities/library_book_entity.dart';

abstract class AwardsRepository {
  Future<List<LibraryBookEntity>> getLibraryBooks();
  Future<AddToCartEntity> addBookToCart(int bookId);
}