part of '../home_view.dart';

final class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> with _HomeViewMixin, TickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => getIt.call()
        ..add(
          FetchProducts(),
        ),
      child: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kGreyLight1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDesignConstants.borderRadiusCircular),
              topRight: Radius.circular(AppDesignConstants.borderRadiusCircular),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              _CustomTabBar(tabController),
              SizedBox(
                height: AppDesignConstants.verticalPaddingLarge,
              ),
              _CustomTabBarView(tabController),
              SizedBox(
                height: AppDesignConstants.verticalPaddingLarge,
              ),
              _FeaturedRow(),
              SizedBox(
                height: AppDesignConstants.verticalPaddingLarge,
              ),
              _FeauturedProducts(scrollController),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
