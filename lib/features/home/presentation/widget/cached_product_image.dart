part of '../home_view.dart';

final class _CachedProductImage extends StatelessWidget {
  final String productImage;
  const _CachedProductImage(this.productImage);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 140, // Adjust this value based on your needs
        maxHeight: 200, // Adjust this value based on your needs
      ),
      child: CachedNetworkImage(
        imageUrl: productImage,
        fit: BoxFit.contain, // This ensures the image maintains its aspect ratio
        placeholder: (context, url) => Skeletonizer(
          enableSwitchAnimation: true,
          enabled: true,
          child: Image.asset(
            AssetConstants.images.headphone,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          AssetConstants.images.headphone,
        ),
      ),
    );
  }
}
