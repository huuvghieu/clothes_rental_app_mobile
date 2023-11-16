import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/present/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
    static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:  Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body:const Body(),
        bottomNavigationBar: const CustomerBottomAppBar(),
      ),
    );
  }

   AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 90,
      title: const Padding(
        padding: EdgeInsets.only(left: 140),
        child: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Solway',
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(right: 50),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}