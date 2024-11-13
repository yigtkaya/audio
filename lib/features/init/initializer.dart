part of '../../../main.dart';

final class _Initializer extends StatelessWidget {
  final Widget child;
  const _Initializer({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) => getIt.call()
            ..add(
              const LoadLanguage(),
            ),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => getIt.call(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => getIt.call(),
        ),
      ],
      child: KeyboardVisibilityProvider(child: child),
    );
  }
}
