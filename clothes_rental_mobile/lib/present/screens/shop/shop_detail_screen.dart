import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/combo_model.dart';
import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:clothes_rental_mobile/data/repositories/combo_repository.dart';
import 'package:clothes_rental_mobile/logics/blocs/combo/combo_bloc.dart';
import 'package:clothes_rental_mobile/present/screens/shop/components/shop_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/customer_bottom_app_bar_shop.dart';

class ShopDetailsScreen extends StatelessWidget {
  static const String routeName = '/shop-details';

  static Route route({required ShopModel shopModel}) {
    return MaterialPageRoute(
      builder: (_) => ShopDetailsScreen(shopModel: shopModel),
      settings: const RouteSettings(name: routeName),
    );
  }

  final ShopModel shopModel;

  const ShopDetailsScreen({required this.shopModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 227, 232),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const BottomAppBarShop(),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //       child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           padding: const EdgeInsets.symmetric(horizontal: 50),
      //           shape: RoundedRectangleBorder(),
      //           primary: Theme.of(context).colorScheme.secondary,
      //         ),
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/basket');
      //         },
      //         child: Text('Basket'),
      //       ),
      //     ],
      //   )),
      // ),
      extendBodyBehindAppBar: true,
      body: BlocProvider(
         create: (context) => ComboBloc(context.read<ComboRepository>())
              ..add(const LoadComboEvent()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 70),
                  ),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/shop1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              ShopInformation(shopModel: shopModel),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Combos in shop',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 21,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              BlocBuilder<ComboBloc, ComboState>(
                builder: (context, state) {
                  if (state is ComboLoadingState) {
                    context
                        .read<ComboBloc>()
                        .add(LoadComboOfShopEvent(shopId: shopModel.id));
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ComboLoadedState) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.comboModels.length,
                        itemBuilder: (context, index) {
                          return _buildProducts(
                              state.comboModels, context, index);
                        });
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProducts(
    List<ComboModel> combos,
    BuildContext context,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/combo', arguments: combos[index]);
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image:  DecorationImage(
                        image: AssetImage(
                            'assets/images/${combos[index].fileName}'),
                        fit: BoxFit.cover)),
                    //     image: NetworkImage(combos[index].fileUrl!,),
                    //     fit: BoxFit.cover
                    // ))
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    combos[index].comboName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Solway',
                        color: AppColor.primaryLight,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Quantity: ${combos[index].quantity}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Solway',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Description: ${combos[index].description}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Solway',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Total vaule: ${combos[index].totalValue}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Solway',
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
