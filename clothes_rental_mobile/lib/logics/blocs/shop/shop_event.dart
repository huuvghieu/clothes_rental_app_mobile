part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();
}
class LoadShopEvent extends ShopEvent {
  const LoadShopEvent();

  @override
  List<Object?> get props => [];
}
