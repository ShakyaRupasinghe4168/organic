// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:organic_plate/screens/user-panel/cart-screen.dart';
import 'package:organic_plate/screens/user-panel/user_profile.dart'; // Import the CartScreen

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        // Handle navigation based on the index
        if (index == 0) {
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        } else if (index == 2) {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen(userData: null,)),
          );
        }
        else if (index == 3) {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen(userData: null,)),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout_sharp),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        
        
      ],
    );
  }
}
