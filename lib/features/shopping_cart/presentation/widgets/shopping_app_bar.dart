part of '../shopping_cart_view.dart';

final class _ShoppingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClear;
  const _ShoppingAppBar(this.onClear);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          LucideIcons.chevronLeft,
          size: AppDesignConstants.iconSize,
        ),
        onPressed: () {
          context.router.back();
        },
      ),
      title: Text(
        context.l10n.shoppingCart,
        style: context.textTheme.titleSmall,
      ),
      actions: [
        IconButton(
          icon: Icon(LucideIcons.trash),
          onPressed: () => onClear(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
