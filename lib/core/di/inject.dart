import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:audio/core/di/inject.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.init();
}
