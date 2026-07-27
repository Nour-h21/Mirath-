import '../../domain/entities/library_book_entity.dart';

class LibraryBookModel extends LibraryBookEntity {
  const LibraryBookModel({
    required super.id,
    required super.name,
    required super.author,
    required super.price,
    required super.image
  });

  factory LibraryBookModel.fromJson(Map<String, dynamic> json) {
    return LibraryBookModel(
      id: json["id"],
      name: json["name"],
      author: json["author"],
      price: json["price"],
      image: json["book_photo"],
    );
  }
}