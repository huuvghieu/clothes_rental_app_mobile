import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:flutter/material.dart';

class ShopInformation extends StatelessWidget {
  const ShopInformation({required this.shopModel, super.key});

  final ShopModel shopModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(
            shopModel.shopName,
            style: const TextStyle(
              fontFamily: 'Solway',
              fontSize: 25,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 10),
          Text(
            '${shopModel.address} - ${shopModel.shopPhone}',
            style:const TextStyle(
              fontFamily: 'Solway',
              fontSize: 16,
              color: Colors.black,
            )
          ),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }
}
