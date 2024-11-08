part of '../product_shop_view.dart';

final class _HeaderTexts extends StatelessWidget {
  final String category;
  final String title;
  const _HeaderTexts(
    this.category,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            category.capitalizeFirstLetter(),
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            style: context.textTheme.titleSmall,
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
