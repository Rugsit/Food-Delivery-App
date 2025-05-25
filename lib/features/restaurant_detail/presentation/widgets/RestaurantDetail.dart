import 'package:ecommerce_project/features/restaurant_detail/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/food/food_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/widgets/FoodCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ServiceType { delivery, pickup }

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({
    super.key,
    required this.restaurant,
  });

  final RestaurantDetailEntity restaurant;

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  ServiceType serviceType = ServiceType.delivery;
  int totalCount = 0;
  double totalPrice = 0.0;
  // Delivery or Pickup
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Padding(
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
                      child: Image.network(widget.restaurant.logo, width: 80),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 3,
                        children: [
                          Text(
                            widget.restaurant.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(widget.restaurant.description),
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
                        Text("4.5 (${widget.restaurant.review}+ review)"),
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
                            "\$${widget.restaurant.minPrice} - \$${widget.restaurant.maxPrice}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Price Range"),
                        ],
                      ),
                      Container(width: 2, height: 30, color: Colors.grey[200]),
                      Column(
                        children: [
                          Text(
                            "${widget.restaurant.lat} km",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Distance"),
                        ],
                      ),
                      Container(width: 2, height: 30, color: Colors.grey[200]),
                      Column(
                        children: [
                          Text(
                            "${widget.restaurant.lat} min",
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
                          onPressed: () {
                            setState(() {
                              serviceType = ServiceType.delivery;
                            });
                          },
                          label: Text("Delivery"),
                          icon: FaIcon(FontAwesomeIcons.truck),
                          style: ButtonStyle(
                            shadowColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            overlayColor: WidgetStatePropertyAll(
                              Colors.grey[50],
                            ),
                            fixedSize: WidgetStatePropertyAll(
                              Size.fromHeight(50),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              serviceType == ServiceType.delivery
                                  ? Colors.white
                                  : Colors.grey[200],
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
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
                          onPressed: () {
                            setState(() {
                              serviceType = ServiceType.pickup;
                            });
                          },
                          label: Text("Pickup"),
                          icon: FaIcon(FontAwesomeIcons.bagShopping),
                          style: ButtonStyle(
                            shadowColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            overlayColor: WidgetStatePropertyAll(
                              Colors.grey[50],
                            ),
                            fixedSize: WidgetStatePropertyAll(
                              Size.fromHeight(50),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              serviceType == ServiceType.pickup
                                  ? Colors.white
                                  : Colors.grey[200],
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
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
                Container(
                  margin: EdgeInsets.only(bottom: 85),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: BlocBuilder<FoodBloc, FoodState>(
                    builder: (context, state) {
                      if (state is FoodLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is FoodFailure) {
                        return Text(state.errorMessage);
                      }
                      if (state is FoodSuccess) {
                        final List<FoodEntity> foods = state.foods;
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: foods.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: screenWidth,
                              child: FoodCard(food: foods[index]),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
