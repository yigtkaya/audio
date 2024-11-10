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
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading || state is UserInitial || state is UserError) {
                return CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.kGrey,
                  child: Icon(
                    Icons.person,
                    color: AppColors.kWhite,
                    size: AppDesignConstants.iconSize,
                  ),
                );
              }
              final user = (state as UserLoaded).user;

              if (user.profilePhotoUrl == null) {
                return CircleAvatar(
                  backgroundColor: AppColors.kGrey,
                  child: Icon(
                    Icons.person,
                    color: AppColors.kWhite,
                    size: AppDesignConstants.iconSize,
                  ),
                );
              }

              return _CustomCircleAvatar(
                user.profilePhotoUrl.toString(),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
