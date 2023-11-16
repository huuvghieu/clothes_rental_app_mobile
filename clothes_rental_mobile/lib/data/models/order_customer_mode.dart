import 'package:equatable/equatable.dart';

class OrderCustomerModel extends Equatable {
  String? id;
  int? total;
  String? note;
  String? creationDate;
  String? status;
  String? customerId;
  String? customerPhone;
  String? customerAddress;
  String? customerName;
  String? shopId;
  String? shopName;
  String? shopEmail;
  String? ownerId;
  String? shopPhone;
  String? shopAddress;
  Object? orderDetails;

  OrderCustomerModel(
      {this.id,
      this.total,
      this.note,
      this.creationDate,
      this.status,
      this.customerId,
      this.customerPhone,
      this.customerAddress,
      this.customerName,
      this.shopId,
      this.shopName,
      this.shopEmail,
      this.ownerId,
      this.shopPhone,
      this.shopAddress,
      this.orderDetails});

  factory OrderCustomerModel.fromJson(Map<String, dynamic> json) {
    return OrderCustomerModel(
        id: json['id'],
        total: json['total'],
        note: json['note'],
        creationDate: json['creationDate'],
        status: json['status'],
        customerId: json['customerId'],
        customerPhone: json['customerPhone'],
        customerAddress: json['customerAddress'],
        customerName: json['customerName'],
        shopId: json['shopId'],
        shopName: json['shopName'],
        shopEmail: json['shopEmail'],
        ownerId: json['ownerId'],
        shopPhone: json['shopPhone'],
        shopAddress: json['shopAddress'],
        orderDetails: json['orderDetails']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['total'] = total;
    data['note'] = note;
    data['creationDate'] = creationDate;
    data['status'] = status;
    data['customerId'] = customerId;
    data['customerPhone'] = customerPhone;
    data['customerAddress'] = customerAddress;
    data['customerName'] = customerName;
    data['shopId'] = shopId;
    data['shopName'] = shopName;
    data['shopEmail'] = shopEmail;
    data['ownerId'] = ownerId;
    data['shopPhone'] = shopPhone;
    data['shopAddress'] = shopAddress;
    return data;
  }

   @override
  List<Object?> get props => [id,
      total,
      note,
      creationDate,
      status,
      customerId,
      customerPhone,
      customerAddress,
      customerName,
      shopId,
      shopName,
      shopEmail,
      ownerId,
      shopPhone,
      shopAddress,
      orderDetails];
}
