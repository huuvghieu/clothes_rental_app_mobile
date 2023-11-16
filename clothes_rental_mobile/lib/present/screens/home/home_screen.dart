import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/logics/blocs/category/category_bloc.dart';
import 'package:clothes_rental_mobile/logics/blocs/shop/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: const CustomerBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 100,
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CategoryLoadedState) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: state.categoryModels.length,
                          itemBuilder: (context, index) {
                            return CategoryBox(
                                categoryModel: state.categoryModels[index]);
                          });
                    }
                    return Container();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 175,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return const ComboBox();
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Top Rated',
                  style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryDark,
                      fontFamily: 'Solway',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            BlocBuilder<ShopBloc, ShopState>(
              builder: (context, state) {
                if (state is ShopLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is ShopLoadedState){
                     return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.shopModels.length,
                  itemBuilder: (context, index) {
                    return ShopCard(shopModel: state.shopModels[index]);
                  },
                );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 90,
      title: const Padding(
        padding: EdgeInsets.only(left: 95),
        child: Text(
          'Clothes Rental',
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
