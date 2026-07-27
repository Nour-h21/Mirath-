import '../entities/request_book_redemption_entity.dart';
import '../repositories/cart_repository.dart';

class RedeemCartUseCase {
  final CartRepository repository;

  RedeemCartUseCase(this.repository);

  // Future<void> call(List<int> ids) {
  //   return repository.redeemBooks(ids);
  // }

 

  Future<BookRedemptionResponseEntity> call(
    List<int> bookIds,
  ) async {
    return await repository.redeemCart(bookIds);
  }
}
