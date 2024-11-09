part of '../product_detail_view.dart';

final class _AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddToCartButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        AppDesignConstants.horizontalPaddingMedium,
      ),
      child: CustomRoundedButton(
        width: double.infinity,
        height: 50.h,
        bgColor: AppColors.kPrimary,
        text: context.l10n.addToCart,
        textStyle: context.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        onTap: onTap,
      ),
    );
  }
}
