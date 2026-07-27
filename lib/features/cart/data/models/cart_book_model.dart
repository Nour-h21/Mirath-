import '../../domain/entities/cart_book_entity.dart';

class CartBookModel extends CartBookEntity {
  const CartBookModel({
    required super.id,
    required super.name,
    required super.author,
    required super.price,
  });

  factory CartBookModel.fromJson(Map<String, dynamic> json) {
    return CartBookModel(
      id: json["id"],
      name: json["name"],
      author: json["author"],
      price: json["price"],
    );
  }
}