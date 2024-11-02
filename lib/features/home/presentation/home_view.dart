import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/core/constants/app_constants.dart';
import 'package:audio/features/home/bloc/user_bloc.dart';
import 'package:audio/features/home/presentation/mixin/home_view_mixin.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/shared/widgets/text_fields/custom_search_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:audio/shared/widgets/icons/asset_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './widget/audio_app_bar.dart';
part './widget/welcome_text.dart';
part './widget/custom_circle_avatar.dart';
part './widget/product_search_bar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => getIt.call()..add(FetchUserEvent()),
      child: Scaffold(
        appBar: _AudioAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingLarge,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppDesignConstants.verticalPaddingLarge,
              ),
              _WelcomeText(),
              SizedBox(
                height: AppDesignConstants.verticalPaddingLarge,
              ),
              _ProdcutSearchBar(
                searchController,
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutRequested());
                },
                child: Text("SignOut"),
              ),
              AssetIcon(
                iconName: AssetConstants.icons.audio,
                color: AppColors.kPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
