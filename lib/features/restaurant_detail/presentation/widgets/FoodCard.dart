import 'package:ecommerce_project/features/restaurant_detail/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key, required this.food});

  final FoodEntity food;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        spacing: 15,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return Container(
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
                                  context.read<OrderBloc>().add(
                                    UpdateTotalProduct(value: -1),
                                  );
                                  context.read<OrderBloc>().add(
                                    UpdateTotalPrice(
                                      value: widget.food.price * -1 * 100,
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
                                  context.read<OrderBloc>().add(
                                    UpdateTotalProduct(value: 1),
                                  );
                                  context.read<OrderBloc>().add(
                                    UpdateTotalPrice(
                                      value: widget.food.price * 100,
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
                                  context.read<OrderBloc>().add(
                                    UpdateTotalProduct(value: 1),
                                  );
                                  context.read<OrderBloc>().add(
                                    UpdateTotalPrice(
                                      value: widget.food.price * 100,
                                    ),
                                  );
                                });
                              },
                              child: FaIcon(FontAwesomeIcons.plus),
                            ),
                          ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
