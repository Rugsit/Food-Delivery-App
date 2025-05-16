import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final RestaurantEntity restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 180,
                height: 100,
                child: Image.network(restaurant.img, fit: BoxFit.cover),
              ),
              IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.all(5),
                style: IconButton.styleFrom(
                  iconSize: 10,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.heart, size: 15),
              ),
            ],
          ),
          Text(restaurant.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            spacing: 5,
            children: [
              FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber, size: 15),
              Text(
                "4.5 (${restaurant.review} review)",
                style: TextStyle(color: Colors.grey[800]),
              ),
            ],
          ),
          Row(
            spacing: 5,
            children: [
              Text(
                "\$${restaurant.minPrice}-\$${restaurant.maxPrice}",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "1.5km · 25min",
                style: TextStyle(color: Colors.grey[800], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
