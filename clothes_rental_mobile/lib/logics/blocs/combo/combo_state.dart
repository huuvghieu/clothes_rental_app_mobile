part of 'combo_bloc.dart';

abstract class ComboState extends Equatable {
  const ComboState();
}

class ComboLoadingState extends ComboState {
  @override
  List<Object> get props => [];
}

class ComboLoadedState extends ComboState {
  const ComboLoadedState(this.comboModels);
  final List<ComboModel> comboModels;

  @override
  List<Object> get props => [comboModels];
}

class ComboErrorState extends ComboState {
  const ComboErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

class ProductComboLoadedState extends ComboState {
  const ProductComboLoadedState(this.productCombos);
  final List<ProductComboModel> productCombos;

  @override
  List<Object> get props => [productCombos];
}
class ProductComboLoadingState extends ComboState {
  @override
  List<Object> get props => [];
}
