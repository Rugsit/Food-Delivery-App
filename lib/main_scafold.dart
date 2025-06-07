import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainScafold extends StatefulWidget {
  const MainScafold({super.key, required this.child});

  final Widget child;

  @override
  State<MainScafold> createState() => _MainScafoldState();
}

class _MainScafoldState extends State<MainScafold> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                setState(() {
                  pageIndex = index;
                });
                context.go("/home");
                break;
              case 1:
                setState(() {
                  pageIndex = index;
                });
                context.go("/restaurant_like");
                break;
            }
          },
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: pageIndex,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidHeart),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUser),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
