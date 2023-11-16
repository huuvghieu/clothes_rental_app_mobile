import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:clothes_rental_mobile/logics/blocs/cart/cart_bloc.dart';
import 'package:clothes_rental_mobile/logics/blocs/order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens.dart';

class ButtonOrder extends StatelessWidget {
  final String shopId;
  String? note;
  final List<OrderDetailModel> details;

  ButtonOrder({
    required this.shopId,
     this.note,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (_, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        if (state is CartLoaded) {
          return Container(
            margin: const EdgeInsets.fromLTRB(33, 0, 0, 0),
            width: 130,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(23.5),
            ),
            child: TextButton(
              onPressed: () => {
                if (state.cart.itemCarts.isEmpty)
                  {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        duration: const Duration(milliseconds: 2000),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Không có sản phẩm!',
                          message: 'Giỏ hàng không có sản phẩm để thanh toán!',
                          contentType: ContentType.failure,
                        ),
                      ))
                  }
                else
                  {
                    context.read<OrderBloc>().add(ConfirmOrderEvent(
                        createOrderModel: CreateOrderModel(
                          note: note,
                          orderDetails: details,
                          shopId: shopId
                        ))),
                    _.read<CartBloc>().add(LoadCartEvent()),
                       Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, ModalRoute.withName('/')),
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                elevation: 0,
                duration: const Duration(milliseconds: 2000),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Order Success!',
                  message: 'Order successfully!',
                  contentType: ContentType.success,
                ),
              )),
                  }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith<
                      RoundedRectangleBorder?>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.3),
                          side: const BorderSide(
                            color: AppColor.primaryColor,
                          ));
                    }
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.3),
                        side: const BorderSide(
                          color: Colors.white,
                        ));
                  }),
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(AppColor.primaryColor)),
              child: const Center(
                child: Text(
                  'Order',
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Solway'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
