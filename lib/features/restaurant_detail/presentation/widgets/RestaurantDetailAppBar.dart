import 'dart:ui';

import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/like/like_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RestaurantDetailAppBar extends StatefulWidget {
  const RestaurantDetailAppBar({
    super.key,
    required this.restaurant,
    required this.initLike,
    required this.restaurantId,
    required this.userId,
  });

  final bool initLike;
  final RestaurantDetailEntity restaurant;
  final String userId;
  final String restaurantId;

  @override
  State<RestaurantDetailAppBar> createState() => _RestaurantDetailAppBarState();
}

class _RestaurantDetailAppBarState extends State<RestaurantDetailAppBar> {
  late bool like;

  @override
  void initState() {
    super.initState();
    like = widget.initLike;
  }

  @override
  Widget build(BuildContext context) {
    final customWhite = Colors.white;
    return SliverAppBar(
      toolbarHeight: 80,
      expandedHeight: 275.0,
      backgroundColor: customWhite,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(widget.restaurant.img, fit: BoxFit.cover),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: customWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
        ),
      ),
      leadingWidth: 96,
      leading: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15),
        child: IconButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            backgroundColor: WidgetStatePropertyAll(customWhite),
          ),
          onPressed: () {
            context.go("/home");
          },
          icon: const FaIcon(FontAwesomeIcons.xmark),
        ),
      ),
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.black,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: IconButton(
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              backgroundColor: WidgetStatePropertyAll(customWhite),
            ),
            onPressed: () {
              if (like) {
                context.read<LikeBloc>().add(
                  UnlikeRestaurant(
                    userId: widget.userId,
                    restaurantId: widget.restaurantId,
                  ),
                );
              } else {
                context.read<LikeBloc>().add(
                  LikeRestaurant(
                    userId: widget.userId,
                    restaurantId: widget.restaurantId,
                  ),
                );
              }
              setState(() {
                like = !like;
              });
            },
            icon: FaIcon(
              like ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: like ? Colors.redAccent : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
