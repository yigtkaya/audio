part of '../shopping_cart_view.dart';

mixin ShoppingCartMixin on State<ShoppingCartView> {
  void onClear() {
    context.read<CartCubit>().clearCart();
  }

  void onRemove(CartItem item) {
    context.read<CartCubit>().removeItem(item.id);
  }

  void onUpdateQuantity(CartItem item, int quantity) {
    context.read<CartCubit>().updateQuantity(item.id, quantity);
  }
}
