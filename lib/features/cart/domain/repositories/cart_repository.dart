import '../entities/cart_entity.dart';
import '../entities/request_book_redemption_entity.dart';

abstract class CartRepository {
  Future<CartEntity> getCart();
// Future<void> redeemBooks(List<int> ids);
 Future<BookRedemptionResponseEntity> redeemCart(
    List<int> bookIds,
  );
}