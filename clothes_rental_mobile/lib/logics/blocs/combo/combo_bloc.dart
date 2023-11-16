import 'package:bloc/bloc.dart';
import 'package:clothes_rental_mobile/data/models/combo_model.dart';
import 'package:clothes_rental_mobile/data/models/product_combo_model.dart';
import 'package:clothes_rental_mobile/data/repositories/combo_repository.dart';
import 'package:equatable/equatable.dart';

part 'combo_event.dart';
part 'combo_state.dart';

class ComboBloc extends Bloc<ComboEvent, ComboState> {
  final ComboRepository _comboRepository;
  ComboBloc(this._comboRepository) : super(ComboLoadingState()) {
    on<LoadComboEvent>((event, emit) async {
      emit(ComboLoadingState());

      try {
        final combos = await _comboRepository.getCombos();
        emit(ComboLoadedState(combos!));
      } catch (e) {
        emit(ComboErrorState(e.toString()));
      }
    });
    on<LoadComboOfShopEvent>(_onLoadComboOfShop);
    on<LoadProductCombosEvent>(_onLoadProductCombos);
  }

  Future<void> _onLoadComboOfShop(
      LoadComboOfShopEvent event, Emitter<ComboState> emit) async {
    try {
      var combos = await _comboRepository.getCombos();
      final list =
          combos!.where((combo) => combo.shopId == event.shopId).toList();
      emit(ComboLoadedState(list));
    } on Exception {}
  }

  Future<void> _onLoadProductCombos(
      LoadProductCombosEvent event, Emitter<ComboState> emit) async {
    try {
      var productCombos =
          await _comboRepository.getProductCombos(event.comboId);
      emit(ProductComboLoadedState(productCombos!));
    } on Exception {}
  }
}
