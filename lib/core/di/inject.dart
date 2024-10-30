import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:audio/core/di/inject.config.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'YOUR_BASE_URL',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
}
