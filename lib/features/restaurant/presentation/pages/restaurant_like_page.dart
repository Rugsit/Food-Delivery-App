import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_like/restaurant_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/widgets/restaurant_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantLikePage extends StatefulWidget {
  const RestaurantLikePage({super.key});

  @override
  State<RestaurantLikePage> createState() => _RestaurantLikePageState();
}

class _RestaurantLikePageState extends State<RestaurantLikePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Restaurant")),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            context.read<RestaurantByLikeBloc>().add(
              FetchRestaurantByLike(state.user.id),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(25),
          child: BlocBuilder<RestaurantByLikeBloc, RestaurantByLikeState>(
            builder: (context, state) {
              if (state is RestaurantByLikeLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is RestaurantByLikeSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantListCard(
                      restaurant: state.restaurants[index],
                    );
                  },
                );
              }
              if (state is RestaurantByLikeFailure) {
                return Text(state.errorMessage);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
