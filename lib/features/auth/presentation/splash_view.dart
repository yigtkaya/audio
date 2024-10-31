import 'package:audio/core/constants/asset_constants.dart';
import 'package:audio/core/router/app_router.gr.dart';
import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/shared/widgets/loading/custom_loading_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Dispatch the CheckAuthentication event when the splash screen loads
    context.read<AuthBloc>().add(CheckAuthentication());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.images.authBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.green.shade900.withOpacity(0.85),
              BlendMode.multiply,
            ),
          ),
        ),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              context.router.replace(const HomeRoute());
              return;
            }
            if (state is Unauthenticated) {
              context.router.replace(
                const LoginRoute(),
              );
            }
          },
          child: const CustomLoadingDialog(),
        ),
      ),
    );
  }
}
