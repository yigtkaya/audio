import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/router/app_router.gr.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/shared/widgets/container/cached_product_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(
        ProductDetailRoute(
          productId: product.id.toString(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingSmall,
          vertical: AppDesignConstants.verticalPaddingMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: CachedProductImage(
                  product.photo!.first,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppDesignConstants.horizontalPaddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.toString(),
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: AppDesignConstants.verticalPaddingSmall,
                  ),
                  Text(
                    product.price.toString(),
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
