import 'package:auto_route/auto_route.dart';
import 'package:audio/core/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: ProductShopRoute.page,
        ),
        AutoRoute(
          page: ProductDetailRoute.page,
        ),
        AutoRoute(
          page: ShoppingCartRoute.page,
        ),
      ];
}
