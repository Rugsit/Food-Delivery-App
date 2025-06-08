import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_type/restaurant_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/widgets/restaurant_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key, required this.type});

  final String type;

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantByTypeBloc>().add(
      FetchRestaurantByType(widget.type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.type)),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(fontSize: 18),
                        children: [
                          TextSpan(text: "Deliver to: ", style: TextStyle()),
                          TextSpan(
                            text: "Current location",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                FaIcon(FontAwesomeIcons.angleRight),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: BlocBuilder<RestaurantByTypeBloc, RestaurantByTypeState>(
                  builder: (context, state) {
                    if (state is RestaurantByTypeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is RestaurantByTypeSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.restaurants.length,
                        itemBuilder: (context, index) {
                          return RestaurantListCard(
                            type: widget.type,
                            restaurant: state.restaurants[index],
                          );
                        },
                      );
                    }
                    if (state is RestaurantByTypeFailure) {
                      return Text(state.errorMessage);
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
