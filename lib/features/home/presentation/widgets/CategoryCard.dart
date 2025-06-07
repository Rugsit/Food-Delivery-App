import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.imgUrl, required this.name});

  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/restaurant_list/$name");
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          spacing: 5,
          children: [
            Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(imgUrl),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
