part of 'product_bloc.dart';

abstract base class ProductEvent extends BaseEvent {}

final class FetchProduct extends ProductEvent {
  final String id;
  FetchProduct(this.id);
}
