import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/restaurant/restaurant_detail_bloc.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/widgets/RestaurantDetail.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/widgets/RestaurantDetailAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
      builder: (context, state) {
        if (state is RestaurantDetailLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is RestaurantDetailFailure) {
          return Text(state.errorMessage);
        }
        if (state is RestaurantDetailSuccess) {
          final RestaurantDetailEntity restaurant = state.restaurant;
          return Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              slivers: [
                RestaurantDetailAppBar(restaurant: restaurant),
                RestaurantDetail(restaurant: restaurant),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
