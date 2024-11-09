part of '../product_detail_view.dart';

mixin _ProductDetailMixin on State<_ProductDetailBody> {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onAddCartPressed(Product product) {
    final cartItem = CartItem(
      id: product.id.toString(),
      name: product.name.toString(),
      price: product.price!.toDouble(),
      photo: product.photo?.first.toString() ?? '',
      quantity: 1,
    );
    context.read<CartCubit>().addItem(cartItem);
  }
}
