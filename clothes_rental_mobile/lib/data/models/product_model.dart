import 'package:clothes_rental_mobile/data/models/product_image_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductModel extends Equatable {
  final String id;
  String? productName;
  String? description;
  String? status;
  int? size;
  String? color;
  String? material;
  double? price;
  double? compesation;
  String? rootProductId;
  final String shopId;
  String? shopName;
  final String categoryId;
  String? categoryName;
  List<ProductModel>? subProducts;
  List<ProductImageModel>? productImages;

  ProductModel(
      {required this.id,
      this.rootProductId,
      required this.shopId,
      required this.categoryId,
      this.productName,
      this.description,
      this.status,
      this.size,
      this.color,
      this.material,
      this.price,
      this.categoryName,
      this.shopName,
      this.compesation,
      this.subProducts,
      this.productImages});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      rootProductId: json['rootProductId'],
      shopId: json['shopId'],
      categoryId: json['categoryId'],
      productName: json['productName'],
      description: json['description'],
      status: json['status'],
      size: json['size'],
      color: json['color'],
      material: json['material'],
      price: json['price'],
      categoryName: json['categoryName'],
      shopName: json['shopName'],
      compesation: json['compesation'],
      subProducts: json['subProducts'],
      productImages: json['productImages'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        rootProductId,
        shopId,
        categoryId,
        productName,
        description,
        status,
        size,
        color,
        material,
        price,
        categoryName,
        shopName,
        compesation,
        subProducts,
        productImages
      ];

  // static List<ProductModel> listProducts = [
  //   ProductModel(
  //     id: '74c46a37-8d6e-444b-817d-59caf1e61b9d',
  //     rootProductId: null,
  //     description: 'Beautifil Dress',
  //     productName: 'Dress',
  //     size: 42,
  //     color: 'white',
  //     material: 'Cotton',
  //     price: 1600000,
  //     status: 'active',
  //     categoryId: '1',
  //     shopId: '1',
  //     productCombos: [],
  //   ),

  //   ProductModel(
  //     id: '938e1e63-2757-4ab7-b61f-c55fb5eb906a',
  //     rootProductId: '74c46a37-8d6e-444b-817d-59caf1e61b9d',
  //     description: 'Beautifil Dress',
  //     productName: 'Eva Dress',
  //     size: 42,
  //     color: 'white',
  //     material: 'Cotton',
  //     price: 1600000,
  //     compesation: 1000000,
  //     status: 'active',
  //     categoryId: '1',
  //     shopId: '1',
  //     productImages: <ProductImageModel>[
  //       ProductImageModel(productId: '938e1e63-2757-4ab7-b61f-c55fb5eb906a',
  //       fileUrl: 'https://scontent.cdninstagram.com/v/t51.2885-15/383809863_1270726216929643_8218233057781150083_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE2MzIuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=UsEGHycRDvIAX93kmzU&edm=APs17CUBAAAA&ccb=7-5&_nc_e2o=s&oh=00_AfAeo0uiykhNqS7n_D54LQt4LgB59McFGbfKuMFMnxQdDw&oe=65569FE5&_nc_sid=10d13b')
  //     ],
  //     productCombos: ProductComboModel.listProductCombo.where((pc) => pc.productId.contains('938e1e63-2757-4ab7-b61f-c55fb5eb906a')).toList()
  //   ),
  //   ProductModel(
  //     id: 'a0cc3ed1-f9ea-4c5b-8625-1a4fc40d9f39',
  //     rootProductId: '74c46a37-8d6e-444b-817d-59caf1e61b9d',
  //     description: 'Beautifil Dress',
  //     productName: 'Rensi Dress',
  //     size: 42,
  //     color: 'black',
  //     material: 'Cotton',
  //     price: 1100000,
  //     compesation: 850000,
  //     status: 'active',
  //     categoryId: '1',
  //     shopId: '2',
  //     productImages: <ProductImageModel>[
  //       ProductImageModel(
  //         id
  //         productId: 'a0cc3ed1-f9ea-4c5b-8625-1a4fc40d9f39',
  //       fileUrl: 'https://scontent.cdninstagram.com/v/t51.2885-15/369622949_1763599507424602_795871474323491701_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE3NTUuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=110&_nc_ohc=0ixjb1-k2pkAX98oVt5&edm=APs17CUBAAAA&ccb=7-5&_nc_e2o=s&oh=00_AfCMccOVxNonUvH0NJKhP3OxfSDWNPjhNrGvkZTtbe13tQ&oe=655748A0&_nc_sid=10d13b')
  //     ],
  //     productCombos: ProductComboModel.listProductCombo.where((pc) => pc.productId.contains('a0cc3ed1-f9ea-4c5b-8625-1a4fc40d9f39')).toList()
  //   ),

  //   ProductModel(
  //     id: '0ffebf97-0113-4af1-8530-aec602279683',
  //     rootProductId: '74c46a37-8d6e-444b-817d-59caf1e61b9d',
  //     description: 'Beautifil Dress',
  //     productName: 'Blood Mini Dress',
  //     size: 42,
  //     color: 'red',
  //     material: 'Cotton',
  //     price: 950000,
  //     compesation: 700000,
  //     status: 'active',
  //     categoryId: '1',
  //     shopId: '3',
  //      productImages: <ProductImageModel>[
  //       ProductImageModel(productId: '0ffebf97-0113-4af1-8530-aec602279683',
  //       fileUrl: 'https://scontent.cdninstagram.com/v/t51.2885-15/370608829_669752691488157_4433527483858814359_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0Mzkuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=SmZb3rHfrTYAX88Sbao&edm=APs17CUBAAAA&ccb=7-5&_nc_e2o=s&oh=00_AfAd7oQ6DtJSDEqVitk9D5UuDqToY3b-94A4HznnwetLXQ&oe=655638C7&_nc_sid=10d13b')
  //     ],
  //      productCombos: ProductComboModel.listProductCombo.where((pc) => pc.productId.contains('0ffebf97-0113-4af1-8530-aec602279683')).toList()
  //   ),
  // ];
}
