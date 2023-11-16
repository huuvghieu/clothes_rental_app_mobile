import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/product_combo_model.dart';
import 'package:flutter/material.dart';

// import '../../../../common/string.dart';

// ignore: must_be_immutable
class ProductComboCard extends StatelessWidget {
  final ProductComboModel productCombo;
  int? index;
  ProductComboCard({required this.productCombo, this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, '/shop-details', arguments: shopModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      // image: AssetImage(AppString.productComboImages[index!]),
                      image: AssetImage('assets/images/${productCombo.productImages![0].fileName}'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'Name: ${productCombo.productName}',
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
                      'Color: ${productCombo.color}',
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
                      'Material: ${productCombo.material}',
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
                      'Size: ${productCombo.size}',
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
                      'Compesation: ${productCombo.compesation}',
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
                      'Description: ${productCombo.description}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Solway',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
