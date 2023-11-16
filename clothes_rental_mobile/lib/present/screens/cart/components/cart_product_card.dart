import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:clothes_rental_mobile/logics/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/colors.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.itemCart,
  });

  final OrderDetailModel itemCart;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CartBloc>(context).add(LoadCartEvent());
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          itemCart.comboName.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<CartBloc>()
                        .add(RemoveItemCartEvent(
                            OrderDetailModel(
                                comboId: itemCart.comboId,
                                comboName: itemCart.comboName,
                                deposit: itemCart.deposit,
                                duration: itemCart.duration,
                                rentalPrice: itemCart.rentalPrice)));
                      },
                      child: const Text(
                        'x',
                        style: TextStyle(
                            color: AppColor.primaryDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        'Duration: ${itemCart.duration}',
                        softWrap: true,
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
                        'Rental Price: ${itemCart.rentalPrice}',
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
                        'Deposit: ${itemCart.deposit}',
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
    );
  }
}
