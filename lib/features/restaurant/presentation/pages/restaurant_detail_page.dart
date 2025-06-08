import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/AlertPopup.dart';
import 'package:ecommerce_project/features/authentication/presentation/widgets/EcomSnackBar.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/local_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/update_order/order_bloc.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/food/food_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/like/like_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_id/restaurant_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/widgets/restaurant_detail.dart';
import 'package:ecommerce_project/features/restaurant/presentation/widgets/restaurant_detail_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    context.read<RestaurantByIdBloc>().add(FetchRestaurantById(widget.id));
    context.read<FoodBloc>().add(FetchFood(restaurantId: widget.id));
  }

  @override
  Widget build(BuildContext mainContext) {
    return BlocBuilder<RestaurantByIdBloc, RestaurantByIdState>(
      builder: (context, state) {
        if (state is RestaurantByIdLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is RestaurantByIdFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is RestaurantByIdSuccess) {
          final RestaurantEntity restaurant = state.restaurant;
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
                        return Container(child: Text(state.toString()));
                      },
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BlocBuilder<OrderLocalBloc, OrderLocalState>(
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
                              onPressed: () {
                                EcomSnackbar(
                                  text: "Successfully added to cart",
                                  isError: false,
                                ).showSnackBar(mainContext);
                                context.read<UpdateOrderBloc>().add(
                                  TriggerUpdateOrderEvent(),
                                );
                                context.pop();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(15),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text("Add to card"),
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
        return Container(child: Text(state.toString()));
      },
    );
  }
}
