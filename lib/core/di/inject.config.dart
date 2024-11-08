// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/bloc/auth_bloc.dart' as _i55;
import '../../features/auth/data/auth_repository.dart' as _i726;
import '../../features/auth/data/auth_repository_impl.dart' as _i781;
import '../../features/home/bloc/user_bloc.dart' as _i677;
import '../../features/home/cubit/category_cubit.dart' as _i207;
import '../../features/home/data/user_repository.dart' as _i799;
import '../../features/home/data/user_repository_impl.dart' as _i520;
import '../../features/product_detail/bloc/product_bloc.dart' as _i422;
import '../../features/product_shop/bloc/products_bloc.dart' as _i997;
import '../../features/product_shop/cubit/filter_cubit.dart' as _i202;
import '../../features/product_shop/data/product_repository.dart' as _i665;
import '../../features/product_shop/data/product_repository_impl.dart' as _i1003;
import '../../localization/helper/local_bloc/language_bloc.dart' as _i300;
import '../services/translation_services.dart' as _i292;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i207.CategoryCubit>(() => _i207.CategoryCubit());
    gh.factory<_i202.FilterCubit>(() => _i202.FilterCubit());
    gh.factory<_i300.LanguageBloc>(() => _i300.LanguageBloc());
    gh.lazySingleton<_i292.TranslationService>(() => _i292.TranslationService());
    gh.factory<_i726.AuthRepository>(() => _i781.AuthRepositoryImpl());
    gh.factory<_i665.ProductRepository>(() => _i1003.ProductRepositoryImpl());
    gh.factory<_i799.UserRepository>(() => _i520.UserRepositoryImpl());
    gh.factory<_i677.UserBloc>(() => _i677.UserBloc(userRepository: gh<_i799.UserRepository>()));
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc(authRepository: gh<_i726.AuthRepository>()));
    gh.factory<_i422.ProductBloc>(() => _i422.ProductBloc(gh<_i665.ProductRepository>()));
    gh.factory<_i997.ProductsBloc>(() => _i997.ProductsBloc(gh<_i665.ProductRepository>()));
    return this;
  }
}
