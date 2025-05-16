import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/RestaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantSlider extends StatelessWidget {
  const RestaurantSlider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.green),
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    Text("View All"),
                    FaIcon(FontAwesomeIcons.arrowRight),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              if (state is RestaurantLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is RestaurantFailure) {
                return Text(state.errorMessage);
              }
              if (state is RestaurantSuccess) {
                final List<RestaurantEntity> restaurants = state.restaurants;
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RestaurantCard(restaurant: restaurants[index]);
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
