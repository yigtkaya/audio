part of '../home_view.dart';

final class _CustomCircleAvatar extends StatelessWidget {
  final String photo;
  const _CustomCircleAvatar(this.photo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(ProfileRoute()),
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(photo),
      ),
    );
  }
}
