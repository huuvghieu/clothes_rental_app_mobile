import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CreateOrderModel extends Equatable {
  String? shopId;
  String? note;
  List<OrderDetailModel>? orderDetails;

  CreateOrderModel({this.shopId, this.note, this.orderDetails});

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) {
    var list = json['orderDetails'] as List<dynamic>;
    List<OrderDetailModel> orderDetail =
        list.map((p) => OrderDetailModel.fromJson(p)).toList();
    return CreateOrderModel(
        note: json['note'], shopId: json['shopId'], orderDetails: orderDetail);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopId'] = shopId;
    data['note'] = note;
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class OrderDetailModel extends Equatable {
  String? comboId;
  String? comboName;
  int? duration;
  String? priceListId;
  double? deposit;
  double? rentalPrice;
  String? shopId;

  OrderDetailModel(
      {this.comboId,
      this.duration,
      this.deposit,
      this.rentalPrice,
      this.priceListId,
      this.shopId,
      this.comboName});

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
        comboId: json['comboId'],
        duration: json['duration'],
        deposit: json['deposit'],
        rentalPrice: json['rentalPrice']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comboId'] = comboId;
    data['duration'] = duration;
    data['deposit'] = deposit;
    data['rentalPrice'] = rentalPrice;
    return data;
  }

  @override
  List<Object?> get props => [comboId, duration, deposit, rentalPrice];
}
