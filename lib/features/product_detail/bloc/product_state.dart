part of 'product_bloc.dart';

abstract base class ProductState extends BaseState {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final Product products;

  const ProductLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

final class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}
