import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/delete_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/update_order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.calculatePrice,
    required this.deleteOrder,
    required this.index,
  });

  final OrderEntity order;
  final Function calculatePrice;
  final Function deleteOrder;
  final int index;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late int count;
  @override
  void initState() {
    super.initState();
    count = widget.order.amount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 2, color: Colors.grey[200]!),
        ),
      ),
      height: 150,
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(widget.order.img, fit: BoxFit.cover),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.order.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${(widget.order.price / 100).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          spacing: 20,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (count <= 0) {
                                  return;
                                }
                                setState(() {
                                  count--;
                                });

                                widget.calculatePrice(widget.order.price * -1);
                                context.read<UpdateOrderBloc>().add(
                                  UpdateOrderEvent(
                                    orderEntity: widget.order.copyWith(
                                      amount: -1,
                                    ),
                                  ),
                                );
                                if (count <= 0) {
                                  widget.deleteOrder(widget.index);
                                  return;
                                }
                              },
                              child: FaIcon(
                                FontAwesomeIcons.minus,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "$count",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                                widget.calculatePrice(widget.order.price);
                                context.read<UpdateOrderBloc>().add(
                                  UpdateOrderEvent(
                                    orderEntity: widget.order.copyWith(
                                      amount: 1,
                                    ),
                                  ),
                                );
                              },
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
