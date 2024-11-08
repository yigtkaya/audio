part of '../product_shop_view.dart';

final class _FilterButton extends StatefulWidget {
  const _FilterButton();

  @override
  State<_FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<_FilterButton> with _FilterButtonMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterButtonPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.kGreyLight2,
          ),
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadius,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
          vertical: AppDesignConstants.verticalPaddingMedium,
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              LucideIcons.slidersVertical,
              size: AppDesignConstants.iconSize,
              color: AppColors.kGreyDark,
            ),
            SizedBox(width: 8.w),
            Text(
              context.l10n.filter,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
