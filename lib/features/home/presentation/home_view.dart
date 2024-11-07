import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/constants/app_constants.dart';
import 'package:audio/features/home/bloc/user_bloc.dart';
import 'package:audio/features/home/cubit/category_cubit.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/features/product_shop/bloc/products_bloc.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/shared/widgets/text_fields/custom_search_text_form_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:audio/shared/widgets/icons/asset_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './mixin/home_view_mixin.dart';
part './widget/audio_app_bar.dart';
part './widget/welcome_text.dart';
part './widget/custom_circle_avatar.dart';
part './widget/product_search_bar.dart';
part 'widget/custom_tab_bar.dart';
part 'widget/custom_tab_bar_skeleton.dart';
part './widget/product_card.dart';
part './widget/featured_row.dart';
part './widget/custom_tab_bar_view.dart';
part './widget/custom_tab_bar_view_skeleton.dart';
part './widget/feautured_products.dart';
part './widget/featured_products_skeleton.dart';
part './widget/product_buy_now_card.dart';
part './widget/cached_product_image.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin, TickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => getIt.call()..add(FetchUserEvent()),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => getIt.call()..add(FetchProducts()),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _AudioAppBar(),
            _WelcomeText(),
            _ProductSearchBar(searchController),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kGreyLight1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDesignConstants.borderRadius),
                    topRight: Radius.circular(AppDesignConstants.borderRadius),
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
          ],
        ),
      ),
    );
  }
}
