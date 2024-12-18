import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Cart/cart_screen.dart';
import 'package:grocery_app/screens/Home/home_screen.dart';
import 'Favorite/favorite.dart';
import 'package:grocery_app/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0; // Initial screen is Home
  List<Widget> screens = const [
    HomeScreen(), // Home Screen
    Favorite(), // Favorite Screen
    CartScreen(), // Cart Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Ensure icons are spaced evenly
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 2 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex], // Show the selected screen
    );
  }
}
