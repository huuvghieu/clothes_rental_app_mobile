import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:clothes_rental_mobile/logics/blocs/cart/cart_bloc.dart';
import 'package:clothes_rental_mobile/present/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/button_pay.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: const CustomerBottomAppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          }
          if (state is CartLoaded) {
            if (state.cart.itemCarts.isEmpty) {
              return const Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Icon(
                      Icons.signal_cellular_no_sim_outlined,
                      color: AppColor.primaryColor,
                      size: 100,
                    ),
                    Text(
                      'No combos \nin your cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 20,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                    child: Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cart.itemCarts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 35,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 180,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Text(
                                                  state.cart.itemCarts[index]
                                                      .comboName
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontFamily: 'Solway',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                BlocProvider.of<CartBloc>(context).
                                                add(
                                                    RemoveItemCartEvent(
                                                        OrderDetailModel(
                                                            comboId: state
                                                                .cart
                                                                .itemCarts[
                                                                    index]
                                                                .comboId,
                                                            comboName: state
                                                                .cart
                                                                .itemCarts[
                                                                    index]
                                                                .comboName,
                                                            deposit: state
                                                                .cart
                                                                .itemCarts[
                                                                    index]
                                                                .deposit,
                                                            duration: state
                                                                .cart
                                                                .itemCarts[
                                                                    index]
                                                                .duration,
                                                            rentalPrice: state
                                                                .cart
                                                                .itemCarts[
                                                                    index]
                                                                .rentalPrice)));
                                              },
                                              child: const Text(
                                                'x',
                                                style: TextStyle(
                                                    color: AppColor.primaryDark,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Text(
                                                    'Duration: ${state.cart.itemCarts[index].duration}',
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Solway',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Text(
                                                    'Rental Price: ${state.cart.itemCarts[index].rentalPrice}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Solway',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  child: Text(
                                                    'Deposit: ${state.cart.itemCarts[index].deposit}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Solway',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 218, 216, 216),
                          )
                        ],
                      );
                    },
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20,right: 30),
                  width: 200,
                  height: 49,
                  child:const ButtonPay(),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 90,
      title: const Padding(
        padding: EdgeInsets.only(left: 150),
        child: Text(
          'Cart',
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
