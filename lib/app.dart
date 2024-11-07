import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/observers/custom_route_observer.dart';
import 'package:audio/core/router/app_router.dart';
import 'package:audio/core/theme/theme.dart';
import 'package:audio/localization/app_localizations.dart';
import 'package:audio/localization/helper/local_bloc/language_bloc.dart';
import 'package:audio/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: AppDesignConstants.designSize,
          minTextAdapt: true,
          splitScreenMode: false,
          child: KeyboardDismissOnTap(
            child: MaterialApp.router(
              title: AppConstants.appName,
              theme: LightTheme.theme,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: _appRouter.config(
                navigatorObservers: () => [
                  CustomRouteObserver(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
