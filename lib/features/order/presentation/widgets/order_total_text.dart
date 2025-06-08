import 'package:flutter/material.dart';

class OrderTotalText extends StatelessWidget {
  const OrderTotalText({
    super.key,
    required this.price,
    required this.text,
    this.isBold,
  });

  final int price;
  final String text;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              isBold == true
                  ? TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  : TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
        Text(
          "\$${(price / 100).toStringAsFixed(2)}",
          style:
              isBold == true
                  ? TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                  : TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
