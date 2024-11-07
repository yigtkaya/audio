part of 'products_bloc.dart';

abstract base class ProductsEvent extends BaseEvent {}

final class FetchProducts extends ProductsEvent {
  FetchProducts();
}
