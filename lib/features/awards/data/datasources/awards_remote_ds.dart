import 'package:dio/dio.dart';

import '../models/add_to_cart_model.dart';
import '../models/library_book_model.dart';

abstract class AwardsRemoteDataSource {
  Future<List<LibraryBookModel>> getLibraryBooks();
  Future<AddToCartModel> addBookToCart(int bookId);
}

class AwardsRemoteDataSourceImpl
    implements AwardsRemoteDataSource {
  final Dio dio;

  AwardsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<LibraryBookModel>> getLibraryBooks() async {
    try {
      final response = await dio.get(
        'getAllLibraryBooks',
      );

      final List books = response.data["data"];
      print(response);

      return books
          .map(
            (e) => LibraryBookModel.fromJson(e),
          )
          .toList();
    } on DioException catch (e) {
      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");
      print("MESSAGE: ${e.message}");
      rethrow;
    }
  } 

  @override
Future<AddToCartModel> addBookToCart(int bookId) async {
  try {
    final response = await dio.post(
      "addBookToCart/$bookId",
    );

    return AddToCartModel.fromJson(response.data);
  } on DioException catch (e) {
    throw Exception(
      e.response?.data["message"] ??
          e.message ??
          "Server Error",
    );
  }
}
}