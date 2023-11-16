import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_model.dart';
import '../../../data/repositories/order_repository.dart';
import '../cart/cart_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CartBloc cartBloc;
  final OrderRepository orderRepository;
  String? id;
  OrderBloc({required this.cartBloc, required this.orderRepository})
      : super(cartBloc.state is CartLoaded
            ? OrderLoadedState(cart: (cartBloc.state as CartLoaded).cart)
            : OrderLoadingState()) {
    on<UpdateOrderEvent>(_onUpdateOrder);
    on<ConfirmOrderEvent>(_onConfirmOrder);
  }

  void _onUpdateOrder(UpdateOrderEvent event, Emitter<OrderState> emit) {
    if (this.state is OrderLoadedState) {
      final state = this.state as OrderLoadedState;
      emit(OrderLoadedState(cart: (cartBloc.state as CartLoaded).cart));
    }
  }

  void _onConfirmOrder(
      ConfirmOrderEvent event, Emitter<OrderState> emit) async {
    if (this.state is OrderLoadedState) {
      try {
        // List<CreateOrderModel> orderList = event.checkoutModel.orderList;
        // orderList.forEach((order) async {
        //   bool rs = await orderRepository.createOrder(true, order);
        //   if (!rs) {
        //     emit(CheckoutFailedState());
        //   }
        // });
        bool rs = await orderRepository.createOrder(event.createOrderModel);
        if (!rs) {
          emit(OrderFailedState());
        }
        emit(OrderSuccessState());
      } catch (_) {
        emit(OrderFailedState());
      }
    }
  }
}
