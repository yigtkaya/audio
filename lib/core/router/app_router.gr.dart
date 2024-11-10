// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audio/features/auth/presentation/forgot_password_view.dart' as _i1;
import 'package:audio/features/auth/presentation/login_view.dart' as _i3;
import 'package:audio/features/auth/presentation/sign_up_view.dart' as _i8;
import 'package:audio/features/auth/presentation/splash_view.dart' as _i9;
import 'package:audio/features/home/presentation/home_view.dart' as _i2;
import 'package:audio/features/product_detail/presentation/product_detail_view.dart' as _i4;
import 'package:audio/features/product_shop/presentation/product_shop_view.dart' as _i5;
import 'package:audio/features/profile/presentation/profile_view.dart' as _i6;
import 'package:audio/features/shopping_cart/presentation/shopping_cart_view.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.ForgotPasswordView]
class ForgotPasswordRoute extends _i10.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.ForgotPasswordView();
    },
  );
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginView();
    },
  );
}

/// generated route for
/// [_i4.ProductDetailView]
class ProductDetailRoute extends _i10.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i11.Key? key,
    required String productId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i4.ProductDetailView(
        key: args.key,
        productId: args.productId,
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productId,
  });

  final _i11.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i5.ProductShopView]
class ProductShopRoute extends _i10.PageRouteInfo<ProductShopRouteArgs> {
  ProductShopRoute({
    _i11.Key? key,
    required String? selectedCategory,
    required String? selectedTitle,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductShopRouteArgs>();
      return _i5.ProductShopView(
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

  final _i11.Key? key;

  final String? selectedCategory;

  final String? selectedTitle;

  @override
  String toString() {
    return 'ProductShopRouteArgs{key: $key, selectedCategory: $selectedCategory, selectedTitle: $selectedTitle}';
  }
}

/// generated route for
/// [_i6.ProfileView]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileView();
    },
  );
}

/// generated route for
/// [_i7.ShoppingCartView]
class ShoppingCartRoute extends _i10.PageRouteInfo<void> {
  const ShoppingCartRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ShoppingCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingCartRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.ShoppingCartView();
    },
  );
}

/// generated route for
/// [_i8.SignUpView]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignUpView();
    },
  );
}

/// generated route for
/// [_i9.SplashView]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashView();
    },
  );
}
