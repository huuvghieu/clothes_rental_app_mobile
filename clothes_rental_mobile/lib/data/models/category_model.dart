import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategoryModel extends Equatable {
  final String id;
  final String categoryName;
  String? creationDate;

  CategoryModel({
    required this.id,
    required this.categoryName,
    this.creationDate,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryName: json['categoryName'],
      creationDate: json['creationDate'],
    );
  }


  @override
  List<Object?> get props => [id, categoryName, creationDate];

  // static List<CategoryModel> categories = [
  //   CategoryModel(
  //     id: 1,
  //     categoryName: 'Drinks',
  //   ),
  //   CategoryModel(
  //     id: 2,
  //     categoryName: 'Pizza',
  //   ),
  //   CategoryModel(
  //     id: 3,
  //     categoryName: 'Burgers',
  //   ),
  //   CategoryModel(
  //     id: 4,
  //     categoryName: 'Desserts',
  //   ),
  //   CategoryModel(
  //     id: 5,
  //     categoryName: 'Salads',
  //   ),
  // ];
}
