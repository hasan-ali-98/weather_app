import 'package:flutter/material.dart';

class CloudObject extends StatelessWidget {
  const CloudObject({
    this.child,
    super.key,
    required this.cloudAnimation,

    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final Animation<double> cloudAnimation;
  final Widget? child;

  final double Function()? top;

  final double Function()? left;

  final double Function()? right;

  final double Function()? bottom;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cloudAnimation,
      builder: (context, preBuiltCloud) {
        return Positioned(
          top: top?.call(),
          left: left?.call(),
          right: right?.call(),
          bottom: bottom?.call(),
          child: preBuiltCloud!,
        );
      },
      child: child,
    );
  }
}
