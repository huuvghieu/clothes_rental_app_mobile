import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/present/screens/screens.dart';
import 'package:flutter/material.dart';


class ButtonLogout extends StatelessWidget {
  const ButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Login.routeName,
            ModalRoute.withName('/'),
          )
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            shadowColor: Colors.black,
            backgroundColor: AppColor.primaryColor),
        child: const Padding(
            padding: EdgeInsets.fromLTRB(
                20, 0, 20, 0 ),
            child: Text(
              'Đăng xuất',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Solway'),
              textAlign: TextAlign.center,
            ),
          )
      ),
    );
  }
}
