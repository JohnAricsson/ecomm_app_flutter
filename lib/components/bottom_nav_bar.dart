import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: GNav(
          gap: 8,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          tabBorderRadius: 16,

          color: Colors.grey,
          activeColor: Colors.blue,
          tabBackgroundColor: Colors.blue.withOpacity(0.1),

          duration: const Duration(milliseconds: 300),

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(icon: Icons.home, text: 'Shop'),
            GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
          ],
        ),
      ),
    );
  }
}
