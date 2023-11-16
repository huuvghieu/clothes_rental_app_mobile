import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<OrderDetailModel> itemCarts;
  const Cart({required this.itemCarts});
  Cart copyWith({
    List<OrderDetailModel>? itemCarts,
  }) {
    return Cart(itemCarts: itemCarts ?? this.itemCarts);
  }

  @override
  List<Object?> get props => [itemCarts];
}
