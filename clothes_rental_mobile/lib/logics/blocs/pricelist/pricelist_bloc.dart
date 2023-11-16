import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/models/price_list_model.dart';
import 'package:clothes_rental_mobile/data/repositories/pricelist_repository.dart';
import 'package:equatable/equatable.dart';

part 'pricelist_event.dart';
part 'pricelist_state.dart';

class PricelistBloc extends Bloc<PricelistEvent, PricelistState> {
  final PriceListRepository _priceListRepository;
  PricelistBloc(this._priceListRepository) : super(PricelistLoadingState()) {
    on<LoadPricelistEvent>((event, emit) async {
      emit(PricelistLoadingState());

      try {
        final listPrice = await _priceListRepository.getPriceLists(event.comboId);
        emit(PricelistLoadedState(listPrice!));
      } catch (e) {
        emit(PricelistErrorState(e.toString()));
      }
    });
  }
}
