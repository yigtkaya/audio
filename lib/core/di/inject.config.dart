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
import '../../localization/helper/bloc/language_bloc.dart' as _i175;

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
    gh.factory<_i175.LanguageBloc>(() => _i175.LanguageBloc());
    gh.factory<_i726.AuthRepository>(() => _i781.AuthRepositoryImpl());
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc(authRepository: gh<_i726.AuthRepository>()));
    return this;
  }
}
