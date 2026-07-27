import 'package:dio/dio.dart';
import '../models/cart_model.dart';
import '../models/request_book_redemption_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  // Future<void> redeemCart(List<int> bookIds);
  Future<BookRedemptionResponseModel> redeemCart(
    List<int> bookIds,
  );
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<CartModel> getCart() async {
    final response = await dio.get('getCartItems');
    print(response);

    return CartModel.fromJson(response.data["data"]);
  }

  // @override
  // Future<void> redeemCart(List<int> bookIds) async {
  //   await dio.post("requestBookRedemption", data: {"book_ids": bookIds});
  // }

  @override
Future<BookRedemptionResponseModel> redeemCart(
  List<int> bookIds,
) async {
  final response = await dio.post(
    "requestBookRedemption",
    data: {
      "book_ids": bookIds,
    },
  );

  return BookRedemptionResponseModel.fromJson(
    response.data,
  );
}
}
