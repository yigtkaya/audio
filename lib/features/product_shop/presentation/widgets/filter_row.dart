part of '../product_shop_view.dart';

final class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingMedium,
      ),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterButton(),
          SizedBox(width: 16.w),
          _QuickFilterChoice(context.l10n.newest),
          SizedBox(width: 16.w),
          _QuickFilterChoice(context.l10n.mostExpensive),
        ],
      ),
    );
  }
}
