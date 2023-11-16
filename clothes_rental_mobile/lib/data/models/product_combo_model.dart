import 'package:clothes_rental_mobile/data/models/product_image_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductComboModel extends Equatable {
  final String id;
  int? quantity;
  String? comboId;
  String? comboName;
  String? shopId;
  String? shopName;
  String? productId;
  String? productName;
  String? description;
  String? status;
  int? size;
  String? color;
  String? material;
  int? price;
  int? compesation;
  String? categoryId;
  String? categoryName;
  List<ProductImageModel>? productImages;

  ProductComboModel(
      {required this.id,
      this.quantity,
      this.comboId,
      this.comboName,
      this.shopId,
      this.shopName,
      this.productId,
      this.productName,
      this.description,
      this.status,
      this.size,
      this.color,
      this.material,
      this.price,
      this.compesation,
      this.categoryId,
      this.categoryName,
      this.productImages});

  factory ProductComboModel.fromJson(Map<String, dynamic> json) {
    var productImagesList = json['productImages'] as List<dynamic>;
    List<ProductImageModel> productImages = productImagesList
        .map((image) => ProductImageModel.fromJson(image))
        .toList();
    return ProductComboModel(
        id: json['id'],
        quantity: json['quantity'],
        comboId: json['comboId'],
        comboName: json['comboName'],
        shopId: json['shopId'],
        shopName: json['shopName'],
        productId: json['productId'],
        productName: json['productName'],
        description: json['description'],
        status: json['status'],
        size: json['size'],
        color: json['color'],
        material: json['material'],
        price: json['price'],
        compesation: json['compesation'],
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        productImages: productImages
        );
  }

  @override
  List<Object?> get props => [
        id,
        quantity,
        comboId,
        comboName,
        shopId,
        shopName,
        productId,
        productName,
        description,
        status,
        size,
        color,
        material,
        price,
        compesation,
        categoryId,
        categoryName,
        productImages
      ];

  // static List<ProductComboModel> listProductCombo = [
  //   ProductComboModel(
  //       comboId: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //       productComoId: '1',
  //       productId: '938e1e63-2757-4ab7-b61f-c55fb5eb906a',
  //       // productModel: ProductModel.listProducts.where((p) =>
  //       //         p.productId.contains('938e1e63-2757-4ab7-b61f-c55fb5eb906a'))
  //       //     as ProductModel),
  //   ),
  //   ProductComboModel(
  //       comboId: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //       productComoId: '2',
  //       productId: 'a0cc3ed1-f9ea-4c5b-8625-1a4fc40d9f39',
  //       // productModel: ProductModel.listProducts.where((p) =>
  //       //         p.productId.contains('a0cc3ed1-f9ea-4c5b-8625-1a4fc40d9f39'))
  //       //     as ProductModel
  //           ),
  //   ProductComboModel(
  //       comboId: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //       productComoId: '3',
  //       productId: '0ffebf97-0113-4af1-8530-aec602279683',
  //       // productModel: ProductModel.listProducts.where((p) =>
  //       //         p.productId.contains('0ffebf97-0113-4af1-8530-aec602279683'))
  //       //     as ProductModel
  //           ),
  // ];
}
