import 'package:clothes_rental_mobile/data/models/combo_model.dart';
import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:clothes_rental_mobile/present/screens/pricelist/price_list_screen.dart';
import 'package:clothes_rental_mobile/present/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../present/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();

      case Login.routeName:
        return Login.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case ProfileScreen.routeName:
        return ProfileScreen.route();

      case OrderScreen.routeName:
        return OrderScreen.route();

      case ShopDetailsScreen.routeName:
        return ShopDetailsScreen.route(
            shopModel: settings.arguments as ShopModel);

      case ComboScreen.routeName:
        return ComboScreen.route(comboModel: settings.arguments as ComboModel);

      case PriceListScreen.routeName:
        return PriceListScreen.route(
            comboModel: settings.arguments as ComboModel);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ),
        settings: const RouteSettings(name: '/home'));
  }
}
