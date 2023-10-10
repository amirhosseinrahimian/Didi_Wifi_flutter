import 'dart:ui';

import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final double elevation;
  late Color? shadowColor;
  late Color? backgroundColor;
  late Color? rippleColor;
  final double radius;
  final VoidCallback? onClick;
  final BorderSide border;
  final bool isBlurred;

  ClickableCard({
    Key? key,
    required this.child,
    this.rippleColor,
    this.shadowColor,
    this.backgroundColor,
    this.elevation = 4.0,
    this.radius = 10.0,
    this.onClick,
    this.height,
    this.width,
    this.border = const BorderSide(color: Colors.transparent, width: 0.0),
    this.isBlurred = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor ??= Theme.of(context).cardColor;
    shadowColor ??= Theme.of(context).colorScheme.background;
    rippleColor ??= Theme.of(context).colorScheme.primary;
    return Card(
      margin: EdgeInsets.zero,
      elevation: elevation,
      color: isBlurred ? Colors.transparent : backgroundColor,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        side: border,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            if (isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: backgroundColor!.withOpacity(0.9),
                  ),
                ),
              ),
            // Actual content
            InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: onClick,
              splashColor: (onClick != null) ? rippleColor!.withOpacity(.2) : backgroundColor,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                child: SizedBox(
                  width: width,
                  height: height,
                  // constraints: const BoxConstraints(
                  //   minWidth: 10.0,
                  //   minHeight: 10.0,
                  // ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeOutCubic,
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
