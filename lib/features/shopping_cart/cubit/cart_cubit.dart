import 'package:audio/features/shopping_cart/cubit/cart_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addItem(CartItem item) {
    try {
      final updatedItems = Map<String, CartItem>.from(state.items);
      if (updatedItems.containsKey(item.id)) {
        final existingItem = updatedItems[item.id]!;
        updatedItems[item.id] = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        );
      } else {
        updatedItems[item.id] = item;
      }
      emit(state.copyWith(items: updatedItems));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void removeItem(String itemId) {
    try {
      final updatedItems = Map<String, CartItem>.from(state.items);
      if (updatedItems.containsKey(itemId)) {
        final existingItem = updatedItems[itemId]!;
        if (existingItem.quantity > 1) {
          updatedItems[itemId] = existingItem.copyWith(
            quantity: existingItem.quantity - 1,
          );
        } else {
          updatedItems.remove(itemId);
        }
      }
      emit(state.copyWith(items: updatedItems));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void clearCart() {
    emit(state.copyWith(items: {}));
  }

  void updateQuantity(String itemId, int quantity) {
    try {
      final updatedItems = Map<String, CartItem>.from(state.items);
      if (updatedItems.containsKey(itemId)) {
        if (quantity > 0) {
          updatedItems[itemId] = updatedItems[itemId]!.copyWith(quantity: quantity);
        } else {
          updatedItems.remove(itemId);
        }
      }
      emit(state.copyWith(items: updatedItems));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
