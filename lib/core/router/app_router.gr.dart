// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audio/features/auth/presentation/forgot_password_view.dart' as _i1;
import 'package:audio/features/auth/presentation/login_view.dart' as _i3;
import 'package:audio/features/auth/presentation/sign_up_view.dart' as _i5;
import 'package:audio/features/auth/presentation/splash_view.dart' as _i6;
import 'package:audio/features/home/presentation/home_view.dart' as _i2;
import 'package:audio/features/product_shop/presentation/product_shop_view.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.ForgotPasswordView]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.ForgotPasswordView();
    },
  );
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginView();
    },
  );
}

/// generated route for
/// [_i4.ProductShopView]
class ProductShopRoute extends _i7.PageRouteInfo<ProductShopRouteArgs> {
  ProductShopRoute({
    _i8.Key? key,
    required String selectedCategory,
    required String selectedTitle,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ProductShopRoute.name,
          args: ProductShopRouteArgs(
            key: key,
            selectedCategory: selectedCategory,
            selectedTitle: selectedTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductShopRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductShopRouteArgs>();
      return _i4.ProductShopView(
        key: args.key,
        selectedCategory: args.selectedCategory,
        selectedTitle: args.selectedTitle,
      );
    },
  );
}

class ProductShopRouteArgs {
  const ProductShopRouteArgs({
    this.key,
    required this.selectedCategory,
    required this.selectedTitle,
  });

  final _i8.Key? key;

  final String selectedCategory;

  final String selectedTitle;

  @override
  String toString() {
    return 'ProductShopRouteArgs{key: $key, selectedCategory: $selectedCategory, selectedTitle: $selectedTitle}';
  }
}

/// generated route for
/// [_i5.SignUpView]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpView();
    },
  );
}

/// generated route for
/// [_i6.SplashView]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashView();
    },
  );
}
