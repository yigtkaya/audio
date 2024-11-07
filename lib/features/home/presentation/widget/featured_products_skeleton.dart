part of '../home_view.dart';

final class _FeaturedProductsSkeleton extends StatelessWidget {
  const _FeaturedProductsSkeleton();

  @override
  Widget build(BuildContext context) {
    final placeHolderProduct = Product(
      name: "Product Name",
      category: "Category",
      photo: [""],
      price: 123,
    );
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 250.h, // Set the maximum height you want
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingLarge,
        ),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => SizedBox(
          width: AppDesignConstants.horizontalPaddingMedium,
        ),
        itemBuilder: (context, index) {
          return _ProductCard(
            product: placeHolderProduct,
          );
        },
      ),
    );
  }
}
