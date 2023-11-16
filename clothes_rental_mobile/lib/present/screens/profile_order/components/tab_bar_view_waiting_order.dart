import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/customer_repository.dart';
import '../../../../logics/blocs/order_customer/order_customer_bloc.dart';
import 'order_waiting_card.dart';

class TabBarViewWaitingOrder extends StatelessWidget {
  const TabBarViewWaitingOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCustomerBloc(
              RepositoryProvider.of<CustomerRepository>(context))
        ..add(const LoadOrderCustomerEvent()),
      child: BlocBuilder<OrderCustomerBloc, OrderCustomerState>(
        builder: (context, state) {
          if (state is OrderCustomerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          }
          if (state is OrderCustomerLoadedState) {
            final checkOrder = state.orderCustomerModel
                .where(
                  (order) => !order.status!.contains('Paid'),
                )
                .toList();
            if (checkOrder.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_document,
                    size: 50,
                    color: AppColor.primaryColor,
                  ),
                  Text(
                    'No orders',
                    style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 25,
                        color: AppColor.primaryColor),
                  ),
                ],
              );
            }

            return Container(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: checkOrder.length,
                    itemBuilder: (context, index) {
                      if (checkOrder.isNotEmpty) {
                        return OrderWaitingCard(
                            orderModel: checkOrder[index]);
                      } else {
                        return const Center(
                          child: Text(
                            'No orders',
                            style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 25,
                                color: AppColor.primaryColor),
                          ),
                        );
                      }
                    },
                  ),
                )
              ]),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
