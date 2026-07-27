import '../entities/add_to_cart_entity.dart';
import '../repositories/awards_repository.dart';

class AddBookToCartUseCase {

  final AwardsRepository repository;

  AddBookToCartUseCase(this.repository);

  Future<AddToCartEntity> call(int bookId) {
    return repository.addBookToCart(bookId);
  }
}