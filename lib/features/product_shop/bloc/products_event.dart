part of 'products_bloc.dart';

abstract base class ProductsEvent extends BaseEvent {}

final class FetchProducts extends ProductsEvent {
  final FilterState filterState;
  FetchProducts(this.filterState);
}
