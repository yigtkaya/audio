part of '../product_shop_view.dart';

final class _SceondaryAudioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SceondaryAudioAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          LucideIcons.chevronLeft,
          size: AppDesignConstants.iconSize,
        ),
        onPressed: () {
          context.router.back();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            LucideIcons.shoppingCart,
          ),
          onPressed: () {
            // context.read<ProductsBloc>().searchProducts('query');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
