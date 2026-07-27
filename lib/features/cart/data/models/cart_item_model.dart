import '../../domain/entities/cart_item_entity.dart';
import 'cart_book_model.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    required super.userId,
    required super.libraryBookId,
    required CartBookModel super.book,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["id"],
      userId: json["user_id"],
      libraryBookId: json["library_book_id"],
      book: CartBookModel.fromJson(json["book"]),
    );
  }
}