// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audio/features/auth/presentation/login_view.dart' as _i1;
import 'package:audio/features/auth/presentation/sign_up_view.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginView();
    },
  );
}

/// generated route for
/// [_i2.SignUpView]
class SignUpRoute extends _i3.PageRouteInfo<void> {
  const SignUpRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SignUpView();
    },
  );
}
