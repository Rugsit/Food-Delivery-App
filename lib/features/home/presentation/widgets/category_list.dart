import 'package:ecommerce_project/core/widget/EcomTextField.dart';
import 'package:ecommerce_project/features/home/domain/entities/category.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String searchKeyWord = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ecomtextfield(
          onChanged: (value) {
            setState(() {
              searchKeyWord = value;
            });
          },
          labelText: "Search for products",
          icon: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.grey[500],
          ),
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CategoryFailure) {
              return Text(state.errorMessage);
            }
            if (state is CategorySuccess) {
              final List<CategoryEntity> categories = state.categories;
              return SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (categories[index].name.toLowerCase().contains(
                          searchKeyWord.toLowerCase(),
                        ) ||
                        searchKeyWord == "") {
                      return CategoryCard(
                        imgUrl: categories[index].imageUrl,
                        name: categories[index].name,
                      );
                    }
                    return Container();
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
