import 'package:dio/dio.dart';

import '../models/books_page_model.dart';

abstract class BooksRemoteDataSource {
  Future<BooksResponseModel> getBooks(int id);
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final Dio dio;

  BooksRemoteDataSourceImpl(this.dio);

  @override
  Future<BooksResponseModel> getBooks(int id) async {
    final response = await dio.get(
      '/getClassificationDetails/$id',
      // options: Options(
      //   headers: {
      //     "Authorization":
      //         "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
      //   },
      // ),
    );

    return BooksResponseModel.fromJson(response.data);
  }
}
