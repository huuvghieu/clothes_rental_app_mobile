import 'package:clothes_rental_mobile/data/models/price_list_model.dart';
import 'package:clothes_rental_mobile/data/models/product_combo_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ComboModel extends Equatable {
  final String id;
  final String comboName;
  int? quantity;
  String? description;
  String? fileName;
  String? fileUrl;
  String? status;
  int? totalValue;
  final String shopId;
  String? shopName;
  List<ProductComboModel>? productCombos;
  List<PriceListModel>? priceList;

  ComboModel({
    required this.id,
    required this.comboName,
    this.quantity,
    this.description,
    this.fileName,
    this.fileUrl,
    this.status,
    this.totalValue,
    this.priceList,
    this.shopName,
    required this.shopId,
    this.productCombos,
  });

  factory ComboModel.fromJson(Map<String, dynamic> json) {
    var listPrice = json['priceList'] as List<dynamic>;
    List<PriceListModel> priceList = listPrice
        .map((p) => PriceListModel.fromJson(p))
        .toList();

        var listCombo = json['productCombos'] as List<dynamic>;
    List<ProductComboModel> productCombos = listCombo
        .map((p) => ProductComboModel.fromJson(p))
        .toList();

    return ComboModel(
      id: json['id'],
      comboName: json['comboName'],
      quantity: json['quantity'],
      description: json['description'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
      status: json['status'],
      totalValue: json['totalValue'],
      priceList: priceList,
      shopId: json['shopId'],
      shopName: json['shopName'],
      productCombos: productCombos
    );
  }

  @override
  List<Object?> get props => [
        id,
        comboName,
        quantity,
        description,
        fileName,
        fileUrl,
        status,
        totalValue,
        priceList,
        shopId,
        shopName,
        productCombos,
      ];
  // static List<ComboModel> listCombo = [
  //   ComboModel(
  //       id: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //       comboName: 'Combo 1',
  //       shopId: '1',
  //       totalValue: 7300000,
  //       status: 'ative',
  //       priceList: PriceListModel.listPriceList,
  //       // productCombos: ProductComboModel.listProductCombo,
  //       quantity: 5,
  //       fileUrl:
  //           'https://i.pinimg.com/564x/e0/24/92/e024923fbeb237384d84bf90f49c1351.jpg'),
  //   ComboModel(
  //       id: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //       comboName: 'Combo 1',
  //       shopId: '1',
  //       totalValue: 7300000,
  //       status: 'ative',
  //       priceList: PriceListModel.listPriceList,
  //       // productCombos: ProductComboModel.listProductCombo,
  //       quantity: 5,
  //       fileUrl:
  //           'https://i.pinimg.com/564x/e0/24/92/e024923fbeb237384d84bf90f49c1351.jpg'),
  //   ComboModel(
  //       id: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //       comboName: 'Combo 1',
  //       shopId: '1',
  //       totalValue: 7300000,
  //       status: 'ative',
  //       priceList: PriceListModel.listPriceList,
  //       // productCombos: ProductComboModel.listProductCombo,
  //       quantity: 5,
  //       fileUrl:
  //           'https://i.pinimg.com/564x/e0/24/92/e024923fbeb237384d84bf90f49c1351.jpg')
  // ];
}
