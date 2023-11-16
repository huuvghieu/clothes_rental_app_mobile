import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/order_customer_mode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderPaidCard extends StatelessWidget {
  const OrderPaidCard({
    required this.orderModel,
    super.key,

  });


  final OrderCustomerModel orderModel;

  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;

    // int sumQuantity() {
    //   int sum = 0;
    //   orderModel.orderDetailList!.forEach((detail) {
    //     sum += detail.quantity!;
    //   });
    //   return sum;
    // }

    DateTime converToDatetime(String dateTime) {
      DateTime date = DateTime.parse(dateTime);
      return date.add(const Duration(days: 7));
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0 , 0 , 0 , 60 ),
      padding: const EdgeInsets.fromLTRB(17 , 17 , 18 , 18 ),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18.2 ),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0x3fd3d1d8),
                offset: Offset(18.2 , 18.2 ),
                blurRadius: 18.2 ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0 , 0 , 1 , 24 ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150 ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Row(
                        children: [
                          Container(
                            width: 90 ,
                            child: Text(
                              '${orderModel.shopName}',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                  ),
                            ),
                          ),
          
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  child: Text(
                    '#${orderModel.id}',
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(1 , 0 , 0 , 8 ),
            width: double.infinity,
            height: 65 ,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(
                            0 , 0 , 1 , 3 ),
                        child: const Text(
                          'Status',
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.kTextColor,
                          ),
                        ),
                      ),
                      Container(
                          // snphmangtrnnggiaofpV (215:1043)
                          constraints: const BoxConstraints(
                            maxWidth: 109 ,
                          ),
                          child: Text(
                            orderModel.status.toString(),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              
            ],
          ),
        ],
      ),
    );
  }
}
