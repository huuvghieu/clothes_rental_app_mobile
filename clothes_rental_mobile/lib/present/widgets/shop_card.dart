import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final ShopModel shopModel;
  const ShopCard({required this.shopModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/shop-details', arguments: shopModel);
      },
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
                  image: DecorationImage(
                      image: AssetImage('assets/images/${shopModel.fileName}'),
                      fit: BoxFit.cover)),
              
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopModel.shopName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Solway',
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  shopModel.address.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Solway',
                    color: Colors.black,
                  ),
                ),
                Text(
                  shopModel.shopPhone.toString(),
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
    );
  }
}
