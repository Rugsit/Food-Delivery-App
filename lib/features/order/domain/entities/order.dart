class OrderEntity {
  OrderEntity({
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

  OrderEntity copyWith({
    String? userId,
    String? foodId,
    int? amount,
    String? name,
    int? price,
    String? img,
  }) {
    return OrderEntity(
      userId: userId ?? this.userId,
      foodId: foodId ?? this.foodId,
      amount: amount ?? this.amount,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
    );
  }
}
