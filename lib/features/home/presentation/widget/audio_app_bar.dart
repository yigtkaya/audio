part of '../home_view.dart';

final class _AudioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AudioAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetIcon(
            iconName: AssetConstants.icons.audio,
            color: AppColors.kPrimary,
            width: 32.r,
            height: 32.r,
          ),
          Text(
            context.l10n.audio,
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(
              Icons.person,
              color: AppColors.kGreyDark,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
