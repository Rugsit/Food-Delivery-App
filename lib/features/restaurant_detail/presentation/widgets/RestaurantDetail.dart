import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantDetail extends StatelessWidget {
  const RestaurantDetail({super.key, required this.restaurant});

  final RestaurantDetailEntity restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(restaurant.logo, width: 80),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(restaurant.description),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Row(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      color: Colors.blueAccent,
                    ),
                    Text("Oak Road, San Francisco"),
                  ],
                ),
                Row(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.amberAccent,
                    ),
                    Text("4.5 (${restaurant.review}+ review)"),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[200]!, width: 2),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "\$${restaurant.minPrice} - \$${restaurant.maxPrice}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Price Range"),
                    ],
                  ),
                  Container(width: 2, height: 30, color: Colors.grey[200]),
                  Column(
                    children: [
                      Text(
                        "${restaurant.lat} km",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Distance"),
                    ],
                  ),
                  Container(width: 2, height: 30, color: Colors.grey[200]),
                  Column(
                    children: [
                      Text(
                        "${restaurant.lat} min",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Time Delivery"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("Delivery"),
                      icon: FaIcon(FontAwesomeIcons.truck),
                      style: ButtonStyle(
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        overlayColor: WidgetStatePropertyAll(Colors.grey[50]),
                        fixedSize: WidgetStatePropertyAll(Size.fromHeight(50)),
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("Pickup"),
                      icon: FaIcon(FontAwesomeIcons.bagShopping),
                      style: ButtonStyle(
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        fixedSize: WidgetStatePropertyAll(Size.fromHeight(50)),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.grey[200],
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
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
