import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/navigat/Homecomponents/carts.dart';
import 'package:storeapp/pages/navigat/favorite.dart';
import 'package:storeapp/pages/navigat/home.dart';
import 'package:storeapp/pages/navigat/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  // user? data = user();

  static const List<Widget> _widgetOptions = <Widget>[
    HomeNave(),
    Favorites(),
    Shope(),
    Userprofile()
  ];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Use 'this' as the vsync argument
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) =>
          Consumer<Mangment>(builder: ((context, value, child) {
        if (value.infousername == '' && value.Products != []) {
          value.getalldata();
          return const Scaffold(
            body: Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: Colors.black,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.favorite,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: Icons.shopping_cart_rounded,
                        text: 'Shop',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          );
        }
      })),
    );
  }
}
