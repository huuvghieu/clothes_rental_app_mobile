import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/present/screens/profile_order/profile_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonOrderProfile extends StatelessWidget {
  const ButtonOrderProfile({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: double.infinity,
      height: 66,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileOrderScreen(),
              ))
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: AppColor.primaryDark,
                    ));
              }
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color(0xffeeeeee),
                  ));
            }),
            backgroundColor: MaterialStateProperty.all(
                AppColor.primaryLight)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: SvgPicture.asset(
              'assets/icons/history-order-icon.svg',
              width: 30,
              height: 30,
            ),
          ),
          const Text(
            'Your Orders',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'Solway'),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: SvgPicture.asset(
              'assets/icons/arrow-next-icon.svg',
              width: 30,
              height: 30,
            ),
          ),
        ]),
      ),
    );
  }
}
