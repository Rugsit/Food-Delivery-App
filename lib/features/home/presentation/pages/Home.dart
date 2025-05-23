import 'package:ecommerce_project/core/widget/EcomButton.dart';
import 'package:ecommerce_project/core/widget/EcomTextField.dart';
import 'package:ecommerce_project/features/home/domain/entities/category.dart';
import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/CategoryCard.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/RestaurantCard.dart';
import 'package:ecommerce_project/features/home/presentation/widgets/RestaurantSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchCategories());
    context.read<RestaurantBloc>().add(FetchRestaurant());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppBar(
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset("assets/images/profile.jpg"),
            ),
            title: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deliver to", style: TextStyle(fontSize: 16)),
                Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      color: Colors.blueAccent,
                    ),
                    Text("St. Pine Lane 036", style: TextStyle(fontSize: 18)),
                    FaIcon(FontAwesomeIcons.angleDown, size: 20),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.heart),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Transform.rotate(
                        angle: -0.5,
                        child: FaIcon(
                          FontAwesomeIcons.ticket,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "You still have 2x unused free delivery coupons",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    EcomButton(
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      text: "Use Now",
                      onPressed: () {},
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Ecomtextfield(
                onChanged: (value) {},
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
                          return CategoryCard(
                            imgUrl: categories[index].imageUrl,
                            name: categories[index].name,
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
              RestaurantSlider(title: "Restaurant Near of You"),
              RestaurantSlider(title: "Recommendations For You"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: 0,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.windowRestore),
              label: "Browse",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.file),
              label: "My Orders",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
