import '../../domain/entities/book_dropdown_entity.dart';

class BookDropDownModel extends BookDropDownEntity {
  const BookDropDownModel({required super.id, required super.title});

  factory BookDropDownModel.fromJson(Map<String, dynamic> json) {
    return BookDropDownModel(id: json['id'], title: json['title']);
  }
}
