import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/common/string.dart';
import 'package:clothes_rental_mobile/present/screens/profile/components/button_logout.dart';
import 'package:clothes_rental_mobile/present/screens/profile/components/button_order.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  child: SizedBox(
                    width: 54,
                    height: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: AppColor.primaryColor,
                        child: const Icon(
                          Icons.person,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppString.userName,
                          overflow: TextOverflow.ellipsis,
                          // maxLines: 1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 17.3,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child:const Column(
              children: [
                ButtonOrderProfile(),
                SizedBox(
                  height: 380,
                ),
                ButtonLogout(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
