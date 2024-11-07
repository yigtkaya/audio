part of '../home_view.dart';

final class _CustomTabBarViewSkeleton extends StatelessWidget {
  final TabController tabController;
  const _CustomTabBarViewSkeleton(
    this.tabController,
  );

  @override
  Widget build(BuildContext context) {
    final placeHolderProduct = Product(
      name: "Product Name",
      category: "Category",
      photo: [""],
      price: 123,
    );
    return SizedBox(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingLarge,
        ),
        child: TabBarView(
          controller: tabController,
          children: [
            _ProductBuyNowCard(
              product: placeHolderProduct,
            ),
            _ProductBuyNowCard(
              product: placeHolderProduct,
            ),
            _ProductBuyNowCard(
              product: placeHolderProduct,
            ),
            _ProductBuyNowCard(
              product: placeHolderProduct,
            ),
          ],
        ),
      ),
    );
  }
}
