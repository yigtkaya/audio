part of '../home_view.dart';

final class _ProductBuyNowCard extends StatelessWidget {
  final Product product;

  const _ProductBuyNowCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadius,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingSmall,
        vertical: AppDesignConstants.verticalPaddingMedium,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    product.name.toString(),
                    textAlign: TextAlign.start,
                    style: context.textTheme.titleSmall,
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(
                  height: AppDesignConstants.verticalPaddingLarge,
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        context.l10n.shopNow,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDesignConstants.horizontalPaddingMedium,
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: AppColors.kPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppDesignConstants.horizontalPaddingLarge,
          ),
          _CachedProductImage(
            product.photo!.first.toString(),
          ),
        ],
      ),
    );
  }
}
