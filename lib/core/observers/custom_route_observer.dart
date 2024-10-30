import 'package:flutter/material.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    // close if keyboard is open
    FocusManager.instance.primaryFocus?.unfocus();

    // Status bar settings
    if (route.settings.name != null) {
      // await StatusBarManager.instance.changeStatusBarBrightness(route.settings.name!);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) async {
    super.didPop(route, previousRoute);

    // close if keyboard is open
    FocusManager.instance.primaryFocus?.unfocus();

    // Status bar settings
    if (previousRoute != null && previousRoute.settings.name != null) {
      //  await StatusBarManager.instance.changeStatusBarBrightness(previousRoute.settings.name!);
    }
  }
}
