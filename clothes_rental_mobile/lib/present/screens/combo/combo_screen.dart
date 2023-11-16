import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/repositories/combo_repository.dart';
import 'package:clothes_rental_mobile/logics/blocs/combo/combo_bloc.dart';
import 'package:clothes_rental_mobile/present/screens/combo/components/product_combo_card.dart';
import 'package:clothes_rental_mobile/present/screens/pricelist/price_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/combo_model.dart';

class ComboScreen extends StatelessWidget {
  static const String routeName = '/combo';

  static Route route({required ComboModel comboModel}) {
    return MaterialPageRoute(
        builder: (_) => ComboScreen(comboModel: comboModel),
        settings: const RouteSettings(name: routeName));
  }

  const ComboScreen({required this.comboModel, super.key});

  final ComboModel comboModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(comboModel),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.primaryColor,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: AppColor.primaryLight,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PriceListScreen.routeName, arguments: comboModel);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ComboBloc(context.read<ComboRepository>())
          ..add(const LoadComboEvent()),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ComboBloc, ComboState>(
                builder: (context, state) {
                  if (state is ComboLoadingState) {
                    context
                        .read<ComboBloc>()
                        .add(LoadProductCombosEvent(comboId: comboModel.id));
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductComboLoadedState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.productCombos.length,
                      itemBuilder: (context, index) {
                        return ProductComboCard(
                          productCombo: state.productCombos[index],
                          index: index,
                        );
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(ComboModel comboModel) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 90,
      title: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Text(
          comboModel.comboName.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Solway',
          ),
        ),
      ),
    );
  }
}
