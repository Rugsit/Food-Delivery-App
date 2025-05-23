import 'package:ecommerce_project/features/restaurant_detail/domain/entities/food.dart';

class FoodModel {
  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.img,
    required this.restaurantId,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final String img;
  final String restaurantId;

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      img: json["img"],
      restaurantId: json["restaurant_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "img": img,
      "restaurant_id": restaurantId,
    };
  }

  FoodEntity toEntity() {
    return FoodEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      img: img,
      restaurantId: restaurantId,
    );
  }
}
