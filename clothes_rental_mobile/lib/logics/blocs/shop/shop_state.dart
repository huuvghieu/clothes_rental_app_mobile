part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();
}

class ShopLoadingState extends ShopState {
  @override
  List<Object> get props => [];
}

class ShopLoadedState extends ShopState {
  const ShopLoadedState(this.shopModels);
  final List<ShopModel> shopModels;

  @override
  List<Object> get props => [shopModels];
}

class ShopErrorState extends ShopState {
  const ShopErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

