part of '../product_shop_view.dart';

final class _QuickFilterChoice extends StatelessWidget {
  final String choice;
  const _QuickFilterChoice(
    this.choice,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadius,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
          vertical: AppDesignConstants.verticalPaddingMedium,
        ),
        child: Text(
          choice,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
