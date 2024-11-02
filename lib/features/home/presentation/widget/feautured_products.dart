part of '../home_view.dart';

final class _FeauturedProducts extends StatelessWidget {
  final ScrollController scrollController;
  const _FeauturedProducts(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 250.h, // Set the maximum height you want
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingLarge,
        ),
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => SizedBox(
          width: AppDesignConstants.horizontalPaddingMedium,
        ),
        itemBuilder: (context, index) {
          return _ProductCard(
            name: "TMA-2 HD Wireless",
            price: "USD 100",
            imagePath: AssetConstants.images.cable,
          );
        },
      ),
    );
  }
}
