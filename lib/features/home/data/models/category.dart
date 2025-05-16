import 'package:ecommerce_project/features/home/domain/entities/category.dart';

class CategoryModel {
  final String id;
  final String img;
  final String name;

  CategoryModel({required this.id, required this.img, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json["id"], img: json["img"], name: json["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "img": img, "name": name};
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, imageUrl: img);
  }
}
