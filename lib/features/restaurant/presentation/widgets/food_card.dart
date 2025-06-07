import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/update_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/local_order/order_bloc.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key, required this.food, required this.userId});

  final FoodEntity food;
  final String userId;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    FoodEntity food = widget.food;
    return BlocListener<UpdateOrderBloc, OrderState>(
      listener: (context, state) {
        if (state is TriggerUpdateOrderState) {
          if (count <= 0) {
            return;
          }
          context.read<UpdateOrderBloc>().add(
            UpdateOrderEvent(
              orderEntity: OrderEntity(
                userId: widget.userId,
                foodId: food.id,
                amount: count,
                name: food.name,
                price: (food.price * 100).toInt(),
                img: food.img,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          spacing: 15,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 80,
              child: Image.network(widget.food.img, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.food.description,
                    style: TextStyle(color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${widget.food.price}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                spacing: 15,
                children:
                    count != 0
                        ? [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count == 0) {
                                  return;
                                }
                                count--;
                                context.read<OrderLocalBloc>().add(
                                  UpdateLocalOrder(
                                    productPrice:
                                        (widget.food.price * 100 * -1).toInt(),
                                    productQuantity: -1,
                                  ),
                                );
                              });
                            },
                            child: FaIcon(FontAwesomeIcons.minus),
                          ),
                          Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                                context.read<OrderLocalBloc>().add(
                                  UpdateLocalOrder(
                                    productPrice:
                                        (widget.food.price * 100).toInt(),
                                    productQuantity: 1,
                                  ),
                                );
                              });
                            },
                            child: FaIcon(FontAwesomeIcons.plus),
                          ),
                        ]
                        : [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                                context.read<OrderLocalBloc>().add(
                                  UpdateLocalOrder(
                                    productPrice:
                                        (widget.food.price * 100).toInt(),
                                    productQuantity: 1,
                                  ),
                                );
                              });
                            },
                            child: FaIcon(FontAwesomeIcons.plus),
                          ),
                        ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
