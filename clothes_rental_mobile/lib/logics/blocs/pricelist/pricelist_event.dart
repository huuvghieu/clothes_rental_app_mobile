part of 'pricelist_bloc.dart';

abstract class PricelistEvent extends Equatable {
  const PricelistEvent();
}

class LoadPricelistEvent extends PricelistEvent {
  const LoadPricelistEvent({
    required this.comboId
  });
  final String comboId;

  @override
  List<Object?> get props => [];
}
