part of '../home_view.dart';

final class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({
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
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadius,
          ),
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
                child: _CachedProductImage(
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
