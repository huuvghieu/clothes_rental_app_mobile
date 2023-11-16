import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:clothes_rental_mobile/data/models/price_list_model.dart';
import 'package:clothes_rental_mobile/data/repositories/pricelist_repository.dart';
import 'package:clothes_rental_mobile/logics/blocs/pricelist/pricelist_bloc.dart';
import 'package:clothes_rental_mobile/present/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/combo_model.dart';
import '../../../logics/blocs/cart/cart_bloc.dart';

class PriceListScreen extends StatelessWidget {
  static const String routeName = '/pricelist';

  static Route route({required ComboModel comboModel}) {
    return MaterialPageRoute(
        builder: (_) => PriceListScreen(comboModel: comboModel),
        settings: const RouteSettings(name: routeName));
  }

  const PriceListScreen({required this.comboModel, super.key});

  final ComboModel comboModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: BlocProvider(
            create: (context) =>
                PricelistBloc(context.read<PriceListRepository>())
                  ..add(LoadPricelistEvent(comboId: comboModel.id)),
            child: SingleChildScrollView(
              child: BlocBuilder<PricelistBloc, PricelistState>(
                builder: (context, state) {
                  if (state is PricelistLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PricelistLoadedState) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Text(
                              'Please choose one price',
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 25,
                                color: AppColor.primaryDark,
                              ),
                            )),
                        ListView.builder(
                          itemCount: state.priceListModels.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PriceListCard(
                              priceListModel: state.priceListModels[index],
                              comboId: comboModel.id,
                              priceListId: state.priceListModels[index].id,
                              comboName: comboModel.comboName,
                              shopId: comboModel.shopId,
                            );
                          },
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 90,
      title: const Padding(
        padding: EdgeInsets.only(left: 50),
        child: Text(
          'Price List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Solway',
          ),
        ),
      ),
    );
  }
}

class PriceListCard extends StatelessWidget {
  final PriceListModel priceListModel;
  final String comboId;
  final String comboName;
  final String priceListId;
  final String shopId;
  const PriceListCard({
    required this.priceListModel,
    required this.comboId,
    required this.comboName,
    required this.priceListId,
    required this.shopId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String duration = priceListModel.duration![0];
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<CartBloc>().add(AddItemCartEvent(
                orderDetailModel: OrderDetailModel(
                    comboId: comboId,
                    priceListId: priceListId,
                    shopId: shopId,
                    comboName: comboName,
                    deposit: (priceListModel.deposit as num).toDouble(),
                    duration: int.parse(duration),
                    rentalPrice: (priceListModel.rentalPrice as num).toDouble())));
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, ModalRoute.withName('/'));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                elevation: 0,
                duration: const Duration(milliseconds: 2000),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Add to cart!',
                  message: 'Add to cart successful!',
                  contentType: ContentType.success,
                ),
              ));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.primaryColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Duration: ${priceListModel.duration}',
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Solway',
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Rental Price: ${priceListModel.rentalPrice}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Solway',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Deposit: ${priceListModel.deposit}',
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
            ),
          ),
        );
      },
    );
  }
}
