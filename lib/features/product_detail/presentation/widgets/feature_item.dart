part of '../product_detail_view.dart';

final class _FeatureItem extends StatelessWidget {
  final Features feature;
  const _FeatureItem(
    this.feature,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        AppDesignConstants.horizontalPaddingLarge,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with grey background
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.kGreyLight2,
              borderRadius: BorderRadius.circular(AppDesignConstants.borderRadius),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: feature.photo.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.name.toString(),
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  feature.description.toString(),
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
