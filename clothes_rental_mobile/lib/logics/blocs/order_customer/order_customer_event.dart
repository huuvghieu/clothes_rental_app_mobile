part of 'order_customer_bloc.dart';

abstract class OrderCustomerEvent extends Equatable {
  const OrderCustomerEvent();
}

class LoadOrderCustomerEvent extends OrderCustomerEvent {
  const LoadOrderCustomerEvent();

  @override
  List<Object?> get props => [];
}
