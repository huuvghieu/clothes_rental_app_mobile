import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PriceListModel extends Equatable {
  final String id;
  final String comboId;
  int? rentalPrice;
  String? duration;
  int? deposit;

  PriceListModel(
      {required this.id,
      required this.comboId,
      this.rentalPrice,
      this.duration,
      this.deposit});

  factory PriceListModel.fromJson(Map<String, dynamic> json) {
    return PriceListModel(
      id: json['id'],
      comboId: json['comboId'],
      rentalPrice: json['rentalPrice'],
      duration: json['duration'],
      deposit: json['deposit']
    );
  }

  @override
  List<Object?> get props => [id, comboId, rentalPrice, duration, deposit];

  // static List<PriceListModel> listPriceList = [
  //   PriceListModel(
  //     comboId: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //     priceListId: '1',
  //     rentalPrice: 800000,
  //     deposit: 6300000,
  //     duration: '1 week',
  //   ),
  //   PriceListModel(
  //     comboId: '4d0939d2-a00e-4e35-88de-212b4686b238',
  //     priceListId: '2',
  //     rentalPrice: 1400000,
  //     deposit: 6300000,
  //     duration: '2 week',
  //   )
  // ];
}
