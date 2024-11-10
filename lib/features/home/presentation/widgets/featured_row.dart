part of '../home_view.dart';

final class _FeaturedRow extends StatelessWidget {
  const _FeaturedRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingLarge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.featured,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 16.sp,
            ),
          ),
          GestureDetector(
            onTap: () => context.router.push(
              ProductShopRoute(
                selectedCategory: null,
                selectedTitle: null,
              ),
            ),
            child: Text(
              context.l10n.seeAll,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.kGrey,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
