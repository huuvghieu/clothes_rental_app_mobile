import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ShopModel extends Equatable {
  final String id;
  final String shopName;
  final String shopCode;
  final String shopEmail;
  String? shopPhone;
  String? address;
  String? fileName;
  String? fileUrl;
  String? status;
  final String ownerId;
  String? ownerName;

  ShopModel(
      {required this.id,
      required this.shopName,
      required this.shopCode,
      required this.shopEmail,
      this.shopPhone,
      this.address,
      this.fileName,
      this.fileUrl,
      this.status,
      required this.ownerId,
      this.ownerName});

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
        id : json['id'],
        shopName : json['shopName'],
        shopCode : json['shopCode'],
        shopEmail : json['shopEmail'],
        shopPhone : json['shopPhone'],
        address : json['address'],
        fileName : json['fileName'],
        fileUrl : json['fileUrl'],
        status : json['status'],
        ownerId : json['ownerId'],
        ownerName : json['ownerName'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        shopName,
        shopCode,
        shopEmail,
        shopPhone,
        address,
        fileName,
        fileUrl,
        status,
        ownerId,
        ownerName
      ];

  // static List<ShopModel> dataShops = [
  //   ShopModel(
  //       shopCode: '1',
  //       shopEmail: 'shop1@gmail.com',
  //       shopName: 'Shop 1',
  //       address: 'Hcm',
  //       fileName:
  //           'https://i.pinimg.com/564x/ce/56/99/ce5699233cbc0f142250b520d967dff7.jpg',
  //       fileUrl:
  //           'https://i.pinimg.com/564x/10/8c/f3/108cf3e6fb881375e9d552901dd0bab0.jpg',
  //       shopPhone: '09999999',
  //       status: 'active',
  //       ownerID: '1',
  //       combos: ComboModel.listCombo.where((c) => c.shopId.contains('1')).toList() ?? [],
  //       owner: OwnerModel(ownerId: '1', ownerName: 'Owneer1'),
  //       products: ProductModel.listProducts
  //           .where((p) => p.shopId.contains('1'))
  //           .toList()),

  //   ShopModel(
  //       shopCode: '2',
  //       shopEmail: 'shop2@gmail.com',
  //       shopName: 'Shop 2',
  //       address: 'Hcm',
  //       fileName:
  //           'https://i.pinimg.com/564x/e9/b9/29/e9b929436e7e38e5199254b8722a089b.jpg',
  //       fileUrl:
  //           'https://i.pinimg.com/564x/b4/4e/94/b44e94a1e97bcf1e046de8a53da48d50.jpg',
  //       shopPhone: '09999999',
  //       status: 'active',
  //       ownerID: '1',
  //       combos: [],
  //       owner: OwnerModel(ownerId: '1', ownerName: 'Owneer1'),
  //       products: ProductModel.listProducts
  //           .where((p) => p.shopId.contains('2'))
  //           .toList()),
  //   ShopModel(
  //       shopCode: '3',
  //       shopEmail: 'shop3@gmail.com',
  //       shopName: 'Shop 3',
  //       address: 'Hcm',
  //       fileName:
  //           'https://i.pinimg.com/736x/63/b4/d1/63b4d1d0528899f30bdcf9970d42afaa.jpg',
  //       fileUrl:
  //           'https://i.pinimg.com/564x/6a/12/bc/6a12bcaacb85fab338a0f214f3613aa1.jpg',
  //       shopPhone: '09999999',
  //       status: 'active',
  //       combos: [],
  //       ownerID: '1',
  //       owner: OwnerModel(ownerId: '1', ownerName: 'Owneer1'),
  //       products: ProductModel.listProducts
  //           .where((p) => p.shopId.contains('3'))
  //           .toList()),
  // ];
}
