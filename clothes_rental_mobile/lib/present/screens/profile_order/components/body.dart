import 'package:clothes_rental_mobile/present/screens/profile_order/components/tab_bar_order.dart';
import 'package:clothes_rental_mobile/present/screens/profile_order/components/tab_bar_view_waiting_order.dart';
import 'package:flutter/material.dart';

import 'tab_bar_view_paid_order.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: TabBarOrder(fem: fem, ffem: ffem),
          ),
        ];
      },
      body: Container(
        padding: EdgeInsets.fromLTRB(20 * fem, 37 * fem, 20 * fem, 8 * fem),
        width: double.infinity,
        child: const TabBarView(
          children: [
            TabBarViewWaitingOrder(
            ),
            TabBarViewPaidOrder(
            )
          ],
        ),
      ),
    );
  }
}
