import 'package:dio/dio.dart';

import '../models/one_book_page_model.dart';

abstract class BookDetailsRemoteDataSource {
  Future<BookDetailsModel> getBookDetails(int id);
}

class BookDetailsRemoteDataSourceImpl implements BookDetailsRemoteDataSource {
  final Dio dio;

  BookDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<BookDetailsModel> getBookDetails(int id) async {
    final response = await dio.get(
      '/getBookDetails/$id',
    );

    return BookDetailsModel.fromJson(response.data);
  }
  
}

