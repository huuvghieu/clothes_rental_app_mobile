part of 'order_customer_bloc.dart';

abstract class OrderCustomerState extends Equatable {
  const OrderCustomerState();
}

class OrderCustomerLoadingState extends OrderCustomerState {
  @override
  List<Object> get props => [];
}

class OrderCustomerLoadedState extends OrderCustomerState {
  const OrderCustomerLoadedState(this.orderCustomerModel);
  final List<OrderCustomerModel> orderCustomerModel;

  @override
  List<Object> get props => [orderCustomerModel];
}

class OrderCustomerErrorState extends OrderCustomerState {
  const OrderCustomerErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

