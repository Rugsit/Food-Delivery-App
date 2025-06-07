import 'package:ecommerce_project/features/order/domain/entities/order.dart';

class OrderModel {
  OrderModel({
    required this.userId,
    required this.foodId,
    required this.amount,
    required this.name,
    required this.price,
    required this.img,
  });

  final String userId;
  final String foodId;
  final int amount;
  final String name;
  final int price;
  final String img;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      userId: json["user_id"],
      foodId: json["food_id"],
      amount: (json["amount"] as num).toInt(),
      name: json["name"],
      price: json["price"],
      img: json["img"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "food_id": foodId,
      "amount": amount,
      "name": name,
      "price": price,
      "img": img,
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      userId: userId,
      foodId: foodId,
      amount: amount,
      name: name,
      price: price,
      img: img,
    );
  }
}
