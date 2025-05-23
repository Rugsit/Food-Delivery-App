import 'package:ecommerce_project/features/restaurant_detail/domain/entities/like.dart';

class LikeModel {
  LikeModel({
    required this.id,
    required this.userId,
    required this.restaurantId,
  });

  final String id;
  final String userId;
  final String restaurantId;

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json["id"],
      userId: json["user_id"],
      restaurantId: json["restaurant_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "user_id": userId, "restaurant_id": restaurantId};
  }

  LikeEntity toEntity() {
    return LikeEntity(id: id, userId: userId, restaurantId: restaurantId);
  }
}
