part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class LoadCartAfterPaymentEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
class RefreshCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
class AddItemCartEvent extends CartEvent {
  final OrderDetailModel orderDetailModel;

  const AddItemCartEvent({
    required this.orderDetailModel,
  });

  @override
  List<Object> get props => [orderDetailModel];
}

class RemoveItemCartEvent extends CartEvent {
  final OrderDetailModel orderDetailModel;

  const RemoveItemCartEvent(this.orderDetailModel);

  @override
  List<Object> get props => [orderDetailModel];
}


