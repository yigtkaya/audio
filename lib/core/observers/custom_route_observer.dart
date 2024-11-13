import 'package:flutter/material.dart';

/// CustomRouteObserver is a custom route observer that extends RouteObserver.
///  It is used to observe the route changes in the app.
@immutable
final class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    // close if keyboard is open
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didPop(Route route, Route? previousRoute) async {
    super.didPop(route, previousRoute);

    // close if keyboard is open
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
