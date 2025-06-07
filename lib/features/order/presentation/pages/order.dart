import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/fetch_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/widgets/order_card.dart';
import 'package:ecommerce_project/features/order/presentation/widgets/order_total_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late List<OrderEntity> orders;
  late bool calculateOnce;
  late int totalPrice;
  int deliveryCharge = 100;
  int tax = 50;

  void calculatePrice(int price) {
    setState(() {
      totalPrice += price;
    });
  }

  void deleteOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUser());
    calculateOnce = false;
    totalPrice = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Food"), centerTitle: true),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            context.read<FetchOrderBloc>().add(GetOrders(state.user.id));
          }
        },
        child: BlocBuilder<FetchOrderBloc, FetchOrderState>(
          builder: (context, state) {
            if (state is FetchOrderLoading || state is FetchOrderInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FetchOrderFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                ),
              );
            }
            if (state is FetchOrderSuccess) {
              orders = state.orders;
              if (!calculateOnce) {
                for (OrderEntity element in orders) {
                  if (element.amount == 0) continue;
                  totalPrice += element.price * element.amount;
                }
                calculateOnce = true;
              }
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.all(15),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          if (orders[index].amount > 0) {
                            return OrderCard(
                              key: ValueKey(orders[index].foodId),
                              index: index,
                              deleteOrder: deleteOrder,
                              order: orders[index],
                              calculatePrice: calculatePrice,
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                    height: 250,
                    child: Column(
                      spacing: 15,
                      children: [
                        OrderTotalText(
                          price: totalPrice,
                          text: "Total price: ",
                        ),
                        OrderTotalText(
                          price: deliveryCharge,
                          text: "Delivery charge: ",
                        ),
                        OrderTotalText(price: tax, text: "Tax: "),
                        OrderTotalText(
                          price: tax + deliveryCharge + totalPrice,
                          text: "Total: ",
                          isBold: true,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll(
                                    Size.fromHeight(50),
                                  ),
                                  foregroundColor: WidgetStatePropertyAll(
                                    Colors.white,
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.blueAccent,
                                  ),
                                ),
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Text(state.toString());
          },
        ),
      ),
    );
  }
}
