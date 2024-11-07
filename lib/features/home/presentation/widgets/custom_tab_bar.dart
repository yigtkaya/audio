part of '../home_view.dart';

final class _CustomTabBar extends StatefulWidget {
  final TabController tabController;

  const _CustomTabBar(this.tabController);

  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> with _CustomTapBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsInitial || state is ProductsLoading) {
          return Center(
            child: _CustomAppBarSkeleton(widget.tabController),
          );
        }

        if (state is ProductsError) {
          return Center(
            child: Text(state.message),
          );
        }

        final categories =
            (state as ProductsLoaded).products.map((product) => product.category.toString()).toSet().toList();
        return TabBar(
          controller: widget.tabController,
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
          tabs: categories
              .map(
                (category) => Tab(
                  text: category,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
