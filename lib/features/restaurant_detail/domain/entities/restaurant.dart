class RestaurantDetailEntity {
  RestaurantDetailEntity({
    required this.id,
    required this.name,
    required this.minPrice,
    required this.maxPrice,
    required this.lat,
    required this.long,
    required this.description,
    required this.review,
    required this.img,
    required this.logo,
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
  final String logo;
}
