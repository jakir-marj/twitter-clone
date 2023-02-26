import 'package:appwrite_test/common/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KCachedImg extends StatelessWidget {
  const KCachedImg({
    Key? key,
    required this.imageUrl,
    this.height = 150,
    this.width,
    this.fit = BoxFit.cover,
    this.color,
    this.radius = 10,
  }) : super(key: key);
  final String imageUrl;
  final double height;
  final double? width;
  final double radius;
  final BoxFit fit;
  final Color? color;

  ImageProvider get provider => CachedNetworkImageProvider(imageUrl,
      maxHeight: height.toInt(), maxWidth: width?.toInt());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        color: color,
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) => KShimmer(
          child: SizedBox(
            height: height,
            width: width ?? 150,
          ),
        ),
      ),
    );
  }
}
