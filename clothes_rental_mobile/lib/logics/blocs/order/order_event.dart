part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

// ignore: must_be_immutable
class UpdateOrderEvent extends OrderEvent {
  CreateOrderModel? createOrderModel;
  UpdateOrderEvent({this.createOrderModel});

  @override
  List<Object?> get props => [createOrderModel];
}

class ConfirmOrderEvent extends OrderEvent {
  final CreateOrderModel createOrderModel;

  const ConfirmOrderEvent({required this.createOrderModel});

  @override
  List<Object?> get props => [createOrderModel];
}
