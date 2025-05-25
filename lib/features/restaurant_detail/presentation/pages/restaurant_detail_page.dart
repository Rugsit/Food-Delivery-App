import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/food/food_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/like/like_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/order/order_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/restaurant/restaurant_detail_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/widgets/RestaurantDetail.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/widgets/RestaurantDetailAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({super.key, required this.id});

  final String id;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantDetailBloc>().add(FetchRestaurant(id: widget.id));
    context.read<FoodBloc>().add(FetchFood(restaurantId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
      builder: (context, state) {
        if (state is RestaurantDetailLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is RestaurantDetailFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is RestaurantDetailSuccess) {
          final RestaurantDetailEntity restaurant = state.restaurant;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    String userId = "";
                    if (state is UserSuccess) {
                      userId = state.user.id;
                      context.read<LikeBloc>().add(
                        FetchLike(userId: userId, restaurantId: restaurant.id),
                      );
                    }
                    return BlocBuilder<LikeBloc, LikeState>(
                      builder: (context, state) {
                        if (state is FetchLikeLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is FetchLikeSuccess) {
                          return CustomScrollView(
                            slivers: [
                              RestaurantDetailAppBar(
                                restaurant: restaurant,
                                initLike: state.like != null,
                                restaurantId: restaurant.id,
                                userId: userId,
                              ),
                              RestaurantDetail(restaurant: restaurant),
                            ],
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BlocBuilder<OrderBloc, OrderState>(
                    builder: (context, state) {
                      if (state.totalProduct == 0) {
                        return Container();
                      }
                      return Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total ${state.totalProduct} ${state.totalProduct > 1 ? "items" : "item"} ",
                                ),
                                Text(
                                  "\$${state.totalPrice / 100}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text("Order now"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
