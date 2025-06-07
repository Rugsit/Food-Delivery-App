import 'package:ecommerce_project/features/restaurant/domain/entities/like.dart';

class LikeModel {
  LikeModel({required this.userId, required this.restaurantId});

  final String userId;
  final String restaurantId;

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      userId: json["user_id"],
      restaurantId: json["restaurant_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"user_id": userId, "restaurant_id": restaurantId};
  }

  LikeEntity toEntity() {
    return LikeEntity(userId: userId, restaurantId: restaurantId);
  }
}
