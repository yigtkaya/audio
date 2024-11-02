part of '../home_view.dart';

final class _AudioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AudioAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: preferredSize.height,
      title: Row(
        children: [
          const Spacer(),
          AssetIcon(
            iconName: AssetConstants.icons.audio,
            color: AppColors.kPrimary,
            width: 32.r,
            height: 32.r,
          ),
          SizedBox(
            width: AppDesignConstants.horizontalPaddingSmall,
          ),
          Text(
            context.l10n.audio,
            style: context.textTheme.titleSmall,
          ),
          const Spacer(),
          CircleAvatar(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
