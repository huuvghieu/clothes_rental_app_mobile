import 'package:clothes_rental_mobile/config/app_router.dart';
import 'package:clothes_rental_mobile/config/theme.dart';
import 'package:clothes_rental_mobile/data/repositories/category_repository.dart';
import 'package:clothes_rental_mobile/data/repositories/combo_repository.dart';
import 'package:clothes_rental_mobile/data/repositories/customer_repository.dart';
import 'package:clothes_rental_mobile/data/repositories/order_repository.dart';
import 'package:clothes_rental_mobile/data/repositories/pricelist_repository.dart';
import 'package:clothes_rental_mobile/data/repositories/shop_repository.dart';
import 'package:clothes_rental_mobile/logics/blocs/cart/cart_bloc.dart';
import 'package:clothes_rental_mobile/logics/blocs/shop/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logics/blocs/category/category_bloc.dart';
import 'logics/blocs/combo/combo_bloc.dart';
import 'present/screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CategoryRepository(),
        ),
        RepositoryProvider(
          create: (context) => ShopRepository(),
        ),
        RepositoryProvider(
          create: (context) => ComboRepository(),
        ),
        RepositoryProvider(
          create: (context) => PriceListRepository(),
        ),
        RepositoryProvider(
          create: (context) => OrderRepository(),
        ),
        RepositoryProvider(
          create: (context) => CustomerRepository(),
        ),        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoryBloc(context.read<CategoryRepository>())
                  ..add(const LoadCategoryEvent()),
          ),
          BlocProvider(
            create: (context) => ShopBloc(context.read<ShopRepository>())
              ..add(const LoadShopEvent()),
          ),
          BlocProvider(
            create: (context) => ComboBloc(context.read<ComboRepository>())
              ..add(const LoadComboEvent()),
          ),
          BlocProvider(
            create: (context) => CartBloc()..add(LoadCartEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          color: Colors.white,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: Login.routeName,
        ),
      ),
    );
  }
}
