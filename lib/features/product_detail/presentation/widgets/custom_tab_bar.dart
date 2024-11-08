part of '../product_detail_view.dart';

final class _CustomTabBar extends StatefulWidget {
  final TabController tabController;
  const _CustomTabBar(this.tabController);

  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        controller: widget.tabController,
        indicatorWeight: 2,
        indicatorColor: AppColors.kPrimary,
        indicatorSize: TabBarIndicatorSize.values[1],
        labelColor: AppColors.kBlack,
        unselectedLabelColor: AppColors.kGrey,
        dividerColor: Colors.transparent,
        labelStyle: context.textTheme.bodyMedium!.copyWith(
          fontSize: 16.sp,
        ),
        unselectedLabelStyle: context.textTheme.bodyLarge!.copyWith(
          color: AppColors.kWhite,
        ),
        tabs: [
          Tab(
            text: context.l10n.overview,
          ),
          Tab(
            text: context.l10n.features,
          ),
        ],
      ),
    );
  }
}
