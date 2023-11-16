import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:flutter/material.dart';

import '../profile_order/components/body.dart';

class ProfileOrderScreen extends StatelessWidget {
  ProfileOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            appBar: buildAppBar(), backgroundColor: Colors.white, body: Body()),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColor.primaryColor,
      shadowColor: Colors.transparent,
      leadingWidth: 70.0,

      title: const Center(
        child: Text(
          'My order',
          style: TextStyle(
            fontFamily: 'Solway',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
