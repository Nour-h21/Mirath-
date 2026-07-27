import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/request_book_redemption_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_ds.dart';

class CartRepositoryImpl
    implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<CartEntity> getCart() {
    return remoteDataSource.getCart();
  }

  @override
// Future<void> redeemBooks(List<int> bookIds) {
//   return remoteDataSource.redeemCart(bookIds);
// }
Future<BookRedemptionResponseEntity> redeemCart(
  List<int> bookIds,
) async {
  return await remoteDataSource.redeemCart(bookIds);
}
}