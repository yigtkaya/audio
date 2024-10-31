part of '../main.dart';

/// Bootstrap the app with the given builder function
Future<void> setup(FutureOr<Widget> Function() builder) async {
  /// Run the app in a zone to catch all errors and log them to the console
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    firebaseConfig();

    configureDependencies();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
    );

    /// Initialize the app database

    Bloc.observer = const AppBlocObserver();

    runApp(await builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack, name: 'setup');
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
  });

  /// Log all errors to the console
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };
}

Future<void> firebaseConfig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  await FirebaseAnalytics.instance.logAppOpen();
}
