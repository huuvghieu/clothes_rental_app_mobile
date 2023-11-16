import 'package:clothes_rental_mobile/common/colors.dart';
import 'package:clothes_rental_mobile/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: AppColor.primaryLight,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Stack(
          children: [
            Positioned(
              left: 18,
              top: 15,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  // color: Colors.white
                ),
                child: SvgPicture.asset('assets/icons/cate-demo-icon.svg')
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(categoryModel.categoryName,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}