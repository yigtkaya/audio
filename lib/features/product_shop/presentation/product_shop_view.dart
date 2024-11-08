import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/extensions/string_extension.dart';
import 'package:audio/features/product_shop/cubit/filter_cubit.dart';
import 'package:audio/localization/l10.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'mixins/product_shop_mixin.dart';
part 'mixins/filter_button_mixin.dart';
part 'mixins/filter_bottom_sheet_mixin.dart';
part './widgets/header_texts.dart';
part './widgets/filter_row.dart';
part './widgets/filter_button.dart';
part './widgets/quick_filter_choice.dart';
part './widgets/filter_bottom_sheet.dart';
part './widgets/sceondary_audio_app_bar.dart';

@RoutePage()
final class ProductShopView extends StatefulWidget {
  final String selectedCategory;
  final String selectedTitle;
  const ProductShopView({
    super.key,
    required this.selectedCategory,
    required this.selectedTitle,
  });

  @override
  State<ProductShopView> createState() => _ProductShopViewState();
}

class _ProductShopViewState extends State<ProductShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SceondaryAudioAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          AppDesignConstants.horizontalPaddingMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderTexts(
              widget.selectedCategory,
              widget.selectedTitle,
            ),
            _FilterRow(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
