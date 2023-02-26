import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class KShimmer extends StatelessWidget {
  const KShimmer({super.key, required this.child});

  KShimmer.card({
    super.key,
    double? height = 200,
    double? width,
    Color childColor = const Color(0xffd0cecc),
  }) : child = Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: childColor,
          ),
        );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Shimmer(
          color: Colors.white,
          duration: const Duration(milliseconds: 1500),
          child: child,
        ),
      ),
    );
  }
}
