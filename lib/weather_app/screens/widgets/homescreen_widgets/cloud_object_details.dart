import 'package:flutter/material.dart';

import '../../../cloud_position_manager.dart';

class CloudObject extends StatelessWidget {
  final Animation<double> cloudAnimation;
  final Widget? child;

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const CloudObject({
    this.child,
    super.key,
    required this.cloudAnimation,
    this.top,
    this.left,
    this.right,
    this.bottom,

    required this.cloudMathFormula,
  });

  final CloudPosition Function(double animationValue) cloudMathFormula;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cloudAnimation,
      builder: (context, preBuiltCloud) {
        final cloudPosition = cloudMathFormula(cloudAnimation.value);
        return Positioned(
          top: cloudPosition.top,
          left: cloudPosition.left,
          right: cloudPosition.right,
          bottom: cloudPosition.bottom,
          child: preBuiltCloud!,
        );
      },
      child: child,
    );
  }
}
