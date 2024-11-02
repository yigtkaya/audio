part of '../home_view.dart';

final class _CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const _CustomTabBar(this.tabController);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: AppColors.kPrimary,
      dividerColor: Colors.transparent,
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
      labelStyle: context.textTheme.bodyLarge,
      indicatorSize: TabBarIndicatorSize.tab, // Makes the indicator match the label width
      labelColor: AppColors.kWhite,
      unselectedLabelColor: AppColors.kGrey,
      tabs: [
        Tab(text: 'Tab 1'),
        Tab(text: 'Tab 2'),
        Tab(text: 'Tab 3'),
        Tab(text: 'Tab 4'),
      ],
    );
  }
}
