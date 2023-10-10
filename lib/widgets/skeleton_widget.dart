import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  late var hColor;

  late var color;

  Widget? child;

  SkeletonWidget({
    super.key,
    this.width = 10,
    this.height = 10,
    this.borderRadius = 10,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    hColor = Theme.of(context).cardColor;
    return Shimmer.fromColors(
      baseColor: color,
      highlightColor: hColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
