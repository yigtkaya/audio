import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/extensions/list_extension.dart';
import 'package:audio/core/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/features/home/domain/features/features_model.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/features/product_detail/bloc/product_bloc.dart';
import 'package:audio/features/shopping_cart/cubit/cart_cubit.dart';
import 'package:audio/features/shopping_cart/cubit/cart_item.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/core/widgets/app_bar/secondary_audio_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './mixins/product_detail_mixin.dart';
part './widgets/header_text.dart';
part './widgets/custom_tab_bar.dart';
part './widgets/overview_tab_view.dart';
part './widgets/features_tab_view.dart';
part './widgets/feature_item.dart';
part './widgets/add_to_cart_button.dart';
part './widgets/sliver_app_bar_delegate.dart';

@RoutePage()
final class ProductDetailView extends StatelessWidget {
  final String productId;
  const ProductDetailView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => getIt.call()..add(FetchProduct(productId)),
      child: const _ProductDetailBody(),
    );
  }
}

final class _ProductDetailBody extends StatefulWidget {
  const _ProductDetailBody();

  @override
  State<_ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<_ProductDetailBody> with TickerProviderStateMixin, _ProductDetailMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const SecondaryAudioAppBar(),
      bottomNavigationBar: _AddToCartButton((product) => onAddCartPressed(product)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _HeaderText(),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              child: _CustomTabBar(_tabController),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                const _OverviewTabView(),
                const _FeaturesTabView(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 80.h),
          ),
        ],
      ),
    );
  }
}
