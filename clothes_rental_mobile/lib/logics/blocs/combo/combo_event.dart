part of 'combo_bloc.dart';

abstract class ComboEvent extends Equatable {
  const ComboEvent();
}

class LoadComboEvent extends ComboEvent {
  const LoadComboEvent();

  @override
  List<Object?> get props => [];
}

class LoadComboOfShopEvent extends ComboEvent {
  const LoadComboOfShopEvent({required this.shopId});
  final String shopId;
  @override
  List<Object?> get props => [shopId];
}

class LoadProductCombosEvent extends ComboEvent {
  const LoadProductCombosEvent({required this.comboId});
  final String comboId;
  @override
  List<Object?> get props => [comboId];
}
