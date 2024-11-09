import 'package:audio/core/constants/asset_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class CachedProductImage extends StatelessWidget {
  final String productImage;
  const CachedProductImage(this.productImage, {super.key});

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
