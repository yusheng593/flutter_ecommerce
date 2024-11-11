import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.onTabChange});

  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: GNav(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          color: Colors.grey,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.center,
          tabActiveBorder: Border.all(color: Colors.white),
          onTabChange: (value) => onTabChange?.call(value),
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: '精選',
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: '購物車',
            )
          ]),
    );
  }
}
