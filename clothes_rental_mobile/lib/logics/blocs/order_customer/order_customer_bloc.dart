import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/models/order_customer_mode.dart';
import 'package:clothes_rental_mobile/data/repositories/customer_repository.dart';
import 'package:equatable/equatable.dart';

part 'order_customer_event.dart';
part 'order_customer_state.dart';

class OrderCustomerBloc extends Bloc<OrderCustomerEvent, OrderCustomerState> {
  final CustomerRepository _customerRepository;
  OrderCustomerBloc(this._customerRepository) : super(OrderCustomerLoadingState()) {
    on<LoadOrderCustomerEvent>((event, emit) async {
      emit(OrderCustomerLoadingState());

      try {
        final orderCustomers = await _customerRepository.getOrderofCustomer();
        emit(OrderCustomerLoadedState(orderCustomers!));
      } catch (e) {
        emit(OrderCustomerErrorState(e.toString()));
      }
    });
  }
}
