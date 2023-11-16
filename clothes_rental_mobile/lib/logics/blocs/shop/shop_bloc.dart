import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/models/shop_model.dart';
import 'package:clothes_rental_mobile/data/repositories/shop_repository.dart';
import 'package:equatable/equatable.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopRepository _shopRepository;
  ShopBloc(this._shopRepository) : super(ShopLoadingState()) {
    on<LoadShopEvent>((event, emit) async {
      emit(ShopLoadingState());

      try {
        final shops = await _shopRepository.getShops();
        emit(ShopLoadedState(shops!));
      } catch (e) {
        emit(ShopErrorState(e.toString()));
      }
    });
  }
}
