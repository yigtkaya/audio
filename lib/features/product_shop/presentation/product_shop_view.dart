import 'package:audio/core/constants/app_design_constant.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part './mixin/product_shop_mixin.dart';

@RoutePage()
final class ProductShopView extends StatefulWidget {
  const ProductShopView({super.key});

  @override
  State<ProductShopView> createState() => _ProductShopViewState();
}

class _ProductShopViewState extends State<ProductShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: AppDesignConstants.iconSize,
          ),
          onPressed: () {
            context.router.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // context.read<ProductsBloc>().searchProducts('query');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          AppDesignConstants.horizontalPaddingMedium,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
