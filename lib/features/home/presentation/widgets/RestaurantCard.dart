import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/like/like_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.initLike,
    required this.userId,
    required this.likeList,
    required this.index,
  });

  final int index;
  final List<bool> likeList;
  final bool initLike;
  final String userId;
  final RestaurantEntity restaurant;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/restaurant_detail/${widget.restaurant.id}");
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 180,
                  height: 100,
                  child: Image.network(
                    widget.restaurant.img,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.all(5),
                  style: IconButton.styleFrom(
                    iconSize: 10,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (!widget.likeList[widget.index]) {
                      context.read<LikeBloc>().add(
                        LikeRestaurant(
                          userId: widget.userId,
                          restaurantId: widget.restaurant.id,
                        ),
                      );
                    } else {
                      context.read<LikeBloc>().add(
                        UnlikeRestaurant(
                          userId: widget.userId,
                          restaurantId: widget.restaurant.id,
                        ),
                      );
                    }
                    setState(() {
                      widget.likeList[widget.index] =
                          !widget.likeList[widget.index];
                    });
                  },
                  icon: FaIcon(
                    widget.likeList[widget.index]
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    size: 15,
                    color:
                        widget.likeList[widget.index]
                            ? Colors.redAccent
                            : Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              widget.restaurant.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 5,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15,
                ),
                Text(
                  "4.5 (${widget.restaurant.review} review)",
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  "\$${widget.restaurant.minPrice}-\$${widget.restaurant.maxPrice}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "1.5km · 25min",
                  style: TextStyle(color: Colors.grey[800], fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
