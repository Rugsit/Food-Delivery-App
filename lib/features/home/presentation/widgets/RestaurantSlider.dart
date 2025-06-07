import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_all/restaurant_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/RestaurantCard.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/like/like_bloc.dart';
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
              if (state is RestaurantListSuccess) {
                final List<RestaurantEntity> restaurants = state.restaurants;
                final List<String> restaurantIdList =
                    restaurants.map((item) => item.id).toList();
                return SizedBox(
                  height: 200,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      String userId = "";
                      if (state is UserSuccess) {
                        userId = state.user.id;
                        context.read<LikeBloc>().add(
                          FetchLikeList(
                            userId: userId,
                            restaurantIdList: restaurantIdList,
                          ),
                        );
                      }
                      return BlocBuilder<LikeBloc, LikeState>(
                        builder: (context, state) {
                          if (state is FetchLikeLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is LikeFailure) {
                            return Text(state.errorMessage);
                          }
                          if (state is FetchLikeListSuccess) {
                            final List<bool> list = state.likedList;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: restaurants.length,
                              itemBuilder: (BuildContext context, int index) {
                                return RestaurantCard(
                                  likeList: list,
                                  index: index,
                                  restaurant: restaurants[index],
                                  initLike: list[index],
                                  userId: userId,
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      );
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
