part of 'pricelist_bloc.dart';

abstract class PricelistState extends Equatable {
  const PricelistState();
}

class PricelistLoadingState extends PricelistState {
  @override
  List<Object> get props => [];
}

class PricelistLoadedState extends PricelistState {
  const PricelistLoadedState(this.priceListModels);
  final List<PriceListModel> priceListModels;

  @override
  List<Object> get props => [priceListModels];
}

class PricelistErrorState extends PricelistState {
  const PricelistErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

