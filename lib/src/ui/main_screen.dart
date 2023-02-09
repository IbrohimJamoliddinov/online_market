import 'package:apilorning/src/ui/menu/explore/explore_screen.dart';
import 'package:apilorning/src/ui/menu/home/home_screen.dart';
import 'package:apilorning/src/ui/menu/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> data = [
    const HomeScreen(),
    const ExploreScreen(),
    Container(),
    Container(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/explore.svg",
              color: selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/offer.svg",
              color: selectedIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: "Offer",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: selectedIndex == 4 ? Colors.blue : Colors.grey,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
