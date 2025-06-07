class FoodEntity {
  FoodEntity({
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
}
