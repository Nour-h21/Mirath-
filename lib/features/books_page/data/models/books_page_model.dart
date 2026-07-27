import '../../../../core/constants/urls.dart';

class BookModel {
  final int id;

  final String title;

  final String authorName;

  final String photo;

  BookModel({
    required this.id,

    required this.title,

    required this.authorName,

    required this.photo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],

      title: json['title'],

      authorName: json['author_name'],

      photo: json['photo'].replaceAll('http://localhost:8000', AppUrls.localhost),
    );
  }
}

class BooksResponseModel {
  final String bio;

  final List<BookModel> books;

  final String message;

  BooksResponseModel({
    required this.bio,

    required this.books,

    required this.message,
  });

  factory BooksResponseModel.fromJson(Map<String, dynamic> json) {
    return BooksResponseModel(
      bio: json['data']['bio'],

      books: List<BookModel>.from(
        json['data']['books'].map((x) => BookModel.fromJson(x)),
      ),

      message: json['message'],
    );
  }
}
