import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:clothes_rental_mobile/logics/blocs/order/order_bloc.dart';
import 'package:clothes_rental_mobile/present/screens/order/components/button_order.dart';
import 'package:clothes_rental_mobile/present/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const OrderScreen());
  }

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      bottomNavigationBar: const CustomerBottomAppBar(),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          }
          if (state is OrderLoadedState) {
                      List<OrderDetailModel> detailList = [];
            return Column(
              children: [
                Expanded(
                    child: Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cart!.itemCarts.length,
                    itemBuilder: (context, index) {
                      for (int i = 0; i < state.cart!.itemCarts.length; i++) {
                        OrderDetailModel item = state.cart!.itemCarts[i];
                        OrderDetailModel detail = OrderDetailModel(
                            comboId: item.comboId,
                            duration: item.duration,
                            deposit: item.deposit,
                            rentalPrice: item.rentalPrice);
                        detailList.add(detail);
                      }

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
                                                  state.cart!.itemCarts[index]
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
                                                    'Duration: ${state.cart!.itemCarts[index].duration}',
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
                                                    'Rental Price: ${state.cart!.itemCarts[index].rentalPrice}',
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
                                                    'Deposit: ${state.cart!.itemCarts[index].deposit}',
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 120),
                  child: TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Note!',
                        contentPadding: const EdgeInsets.only(
                            left: 20, bottom: 5, right: 5),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 197, 197, 197)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 197, 197, 197)),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 30),
                  width: 200,
                  height: 49,
                  child:  ButtonOrder(
                    details: detailList,
                    shopId: state.cart!.itemCarts[0].shopId!,
                    note: noteController.text,
                  ),
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
        padding: EdgeInsets.only(left: 80),
        child: Text(
          'Order',
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
