import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductImageModel extends Equatable {
  final String id;
  String? productId;
  String? fileName;
  String? fileUrl;

  ProductImageModel(
      {required this.id, this.fileName, this.fileUrl, this.productId});

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json['id'],
      productId: json['productId'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl']
    );
  }

  @override
  List<Object?> get props => [id, fileName, fileUrl, productId];
}
