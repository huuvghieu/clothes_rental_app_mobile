import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OwnerModel extends Equatable {
  final String ownerId;
  final String ownerName;
  String? phone;
  String? gender;
  String? address;
  String? password;
  String? status;
  List<ShopModel>? shops;

  OwnerModel(
      {required this.ownerId,
      required this.ownerName,
      this.phone,
      this.gender,
      this.address,
      this.password,
      this.shops,
      this.status});

  @override
  List<Object?> get props =>
      [ownerId, ownerName, phone, gender, address, password, status, shops];
}
