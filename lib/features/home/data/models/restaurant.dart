import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';

class RestaurantModel {
  RestaurantModel({
    required this.id,
    required this.name,
    required this.minPrice,
    required this.maxPrice,
    required this.lat,
    required this.long,
    required this.description,
    required this.review,
    required this.img,
  });

  final String id;
  final String name;
  final double minPrice;
  final double maxPrice;
  final double? lat;
  final double? long;
  final String description;
  final int review;
  final String img;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json["id"],
      name: json["name"],
      minPrice: (json["price_range_min"] as num).toDouble(),
      maxPrice: (json["price_range_max"] as num).toDouble(),
      lat: (json["lat"] as num).toDouble(),
      long: (json["long"] as num).toDouble(),
      description: json["description"],
      review: json["review"],
      img: json["img"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price_range_min": minPrice,
      "price_range_max": maxPrice,
      "lat": lat,
      "long": long,
      "description": description,
      "review": review,
      "img": img,
    };
  }

  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id: id,
      name: name,
      minPrice: minPrice,
      maxPrice: maxPrice,
      lat: lat,
      long: long,
      description: description,
      review: review,
      img: img,
    );
  }
}
