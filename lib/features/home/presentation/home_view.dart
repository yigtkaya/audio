import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/constants/app_constants.dart';
import 'package:audio/core/router/app_router.gr.dart';
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

part 'mixins/home_view_mixin.dart';
part 'mixins/custom_tab_bar_mixin.dart';
part 'widgets/audio_app_bar.dart';
part 'widgets/welcome_text.dart';
part 'widgets/custom_circle_avatar.dart';
part 'widgets/product_search_bar.dart';
part 'widgets/custom_tab_bar.dart';
part 'widgets/custom_tab_bar_skeleton.dart';
part 'widgets/product_card.dart';
part 'widgets/featured_row.dart';
part 'widgets/custom_tab_bar_view.dart';
part 'widgets/custom_tab_bar_view_skeleton.dart';
part 'widgets/feautured_products.dart';
part 'widgets/featured_products_skeleton.dart';
part 'widgets/product_buy_now_card.dart';
part 'widgets/cached_product_image.dart';
part 'widgets/home_body.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => getIt.call()
            ..add(
              FetchUserEvent(),
            ),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => getIt.call(),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _AudioAppBar(),
            _WelcomeText(),
            _ProductSearchBar(),
            _HomeBody(),
          ],
        ),
      ),
    );
  }
}
