part of '../home_view.dart';

final class _CustomAppBarSkeleton extends StatelessWidget {
  final TabController tabController;
  const _CustomAppBarSkeleton(this.tabController);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColors.kPrimary,
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingLarge,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusCircular,
          ),
          border: Border(
            bottom: BorderSide.none,
          ),
          color: AppColors.kPrimary,
        ),
        indicatorPadding: EdgeInsets.zero, // Remove padding between label and indicator
        labelStyle: context.textTheme.bodyMedium,
        indicatorSize: TabBarIndicatorSize.tab, // Makes the indicator match the label width
        labelColor: AppColors.kWhite,
        unselectedLabelColor: AppColors.kGrey,
        tabs: List.generate(
          4,
          (index) => Tab(
            text: context.l10n.headband,
          ),
        ),
      ),
    );
  }
}
