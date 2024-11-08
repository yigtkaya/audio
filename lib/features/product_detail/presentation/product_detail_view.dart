import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/features/product_detail/bloc/product_bloc.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/shared/widgets/app_bar/sceondary_audio_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './widgets/header_text.dart';
part './widgets/custom_tab_bar.dart';

@RoutePage()
final class ProductDetailView extends StatelessWidget {
  final String productId;
  const ProductDetailView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => getIt.call()
        ..add(
          FetchProduct(productId),
        ),
      child: const _ProductDetailBody(),
    );
  }
}

final class _ProductDetailBody extends StatefulWidget {
  const _ProductDetailBody();

  @override
  State<_ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<_ProductDetailBody> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAudioAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
        ),
        child: Column(
          children: [
            _HeaderText(),
            _CustomTabBar(_tabController),
          ],
        ),
      ),
    );
  }
}
