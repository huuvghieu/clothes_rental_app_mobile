part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderLoadingState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoadedState extends OrderState {
  final Cart? cart;
  const OrderLoadedState({this.cart});

  @override
  List<Object?> get props => [cart];
}

class OrderFailedState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderSuccessState extends OrderState {
  @override
  List<Object?> get props => [];
}
