import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/models/cart_model.dart';
import 'package:clothes_rental_mobile/data/models/create/create_order_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCartEvent>(_onCartStarted);
    on<RefreshCartEvent>(_onCartRefresh);
    on<AddItemCartEvent>(_onCartItemAdded);
    on<RemoveItemCartEvent>(_onCartItemRemoved);
  }

  Future<void> _onCartStarted(
      LoadCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded(cart: Cart(itemCarts: [])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onCartRefresh(
      RefreshCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded(cart: Cart(itemCarts: [])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onCartItemAdded(
      AddItemCartEvent event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        List<OrderDetailModel> list = state.cart.itemCarts
            .where(
              (e) => e.comboId == event.orderDetailModel.comboId,
            )
            .toList();
        if (list.isEmpty) {
          emit(
            CartLoaded(
                cart: state.cart.copyWith(
                    itemCarts: List.from(state.cart.itemCarts)
                      ..add(event.orderDetailModel))),
          );
        } else {
          emit(
            CartLoaded(
                cart: state.cart
                    .copyWith(itemCarts: List.from(state.cart.itemCarts))),
          );
        }
      } on Exception {
        emit(CartError());
      }
    }
  }

  Future<void> _onCartItemRemoved(
      RemoveItemCartEvent event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
              cart: state.cart.copyWith(
                  itemCarts: List.from(state.cart.itemCarts)
                    ..remove(event.orderDetailModel))),
        );
      } catch (_) {}
    }
  }
}
