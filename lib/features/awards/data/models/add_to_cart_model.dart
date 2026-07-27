import '../../domain/entities/add_to_cart_entity.dart';

class AddToCartModel extends AddToCartEntity {
  const AddToCartModel({
    required super.message,
    required super.status
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      message: json["message"],
      status: json["status"]
    );
  }
}