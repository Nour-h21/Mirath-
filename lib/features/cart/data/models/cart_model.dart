import '../../domain/entities/cart_entity.dart';
import 'cart_item_model.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.items,
    required super.totalPoints,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json["items"] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
      totalPoints: json["total_points"],
    );
  }
}