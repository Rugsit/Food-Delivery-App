import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RestaurantListCard extends StatelessWidget {
  const RestaurantListCard({super.key, required this.restaurant, this.type});

  final RestaurantEntity restaurant;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/restaurant_detail/${restaurant.id}");
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              style: BorderStyle.solid,
              width: 2,
              color: Colors.grey[200]!,
            ),
          ),
        ),
        margin: EdgeInsets.only(bottom: 15),
        height: 120,
        child: Row(
          spacing: 10,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                restaurant.img,
                fit: BoxFit.cover,
                width: 120,
                height: double.infinity,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amberAccent,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text("4.8 (${restaurant.review})"),
                    ],
                  ),
                  Text(
                    restaurant.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
