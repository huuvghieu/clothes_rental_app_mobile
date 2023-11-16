import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/present/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class CustomerBottomAppBar extends StatelessWidget {
  const CustomerBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.primaryColor,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, CartScreen.routeName);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ProfileScreen.routeName);
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
