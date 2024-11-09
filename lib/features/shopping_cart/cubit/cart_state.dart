part of 'cart_cubit.dart';

final class CartState extends Equatable {
  final Map<String, CartItem> items;
  final bool isLoading;
  final String? error;

  const CartState({
    this.items = const {},
    this.isLoading = false,
    this.error,
  });

  double get totalPrice => items.values.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  int get totalItems => items.values.fold(
        0,
        (sum, item) => sum + item.quantity,
      );

  CartState copyWith({
    Map<String, CartItem>? items,
    bool? isLoading,
    String? error,
  }) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, error];
}
