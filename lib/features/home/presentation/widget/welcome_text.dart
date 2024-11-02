part of '../home_view.dart';

final class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${context.l10n.welcome}, ${state.user.name.toString()}",
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(
                height: AppDesignConstants.verticalPaddingSmall,
              ),
              Text(
                context.l10n.welcomeText,
                style: context.textTheme.bodyLarge,
              ),
            ],
          );
        }

        if (state is UserLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppConstants.appName,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(
                  height: AppDesignConstants.verticalPaddingMedium,
                ),
                Text(
                  context.l10n.welcomeText,
                  style: context.textTheme.bodyLarge,
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
