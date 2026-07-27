import 'cart_book_entity.dart';

class CartItemEntity {
  final int id;
  final int userId;
  final int libraryBookId;
  final CartBookEntity book;

  const CartItemEntity({
    required this.id,
    required this.userId,
    required this.libraryBookId,
    required this.book,
  });
}