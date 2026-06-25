class CloudPosition {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  CloudPosition({this.left, this.top, this.bottom, this.right});
}

class cloudFormula {
  static CloudPosition Cloud1Math(
    double maxWidth,
    double maxHeigh,
    double factor,
    double animationValue,
  ) {
    return CloudPosition(
      top: maxHeigh * factor,
      left: 2 * maxWidth * animationValue - maxWidth * 0.765,
    );
  }

  static CloudPosition Cloud2Math(
    double maxWidth,
    double maxHeigh,
    double factor,
    double animationValue,
  ) {
    return CloudPosition(
      top: maxHeigh * (factor + 0.05),
      right: 2 * maxWidth * animationValue - (maxWidth * 0.765),
    );
  }

  static CloudPosition Cloud3Math(
    double maxWidth,
    double maxHeigh,
    double factor,
    double animationValue,
  ) {
    return CloudPosition(
      top: maxHeigh * (factor + 0.1),
      left: 2 * maxWidth * animationValue - maxWidth * 0.765,
    );
  }

  static CloudPosition CloudBottomLeftMath(
    double maxWidth,
    double maxHeigh,
    double factor,
    double animationValue,
  ) {
    return CloudPosition(
      bottom: -40.0 + ((animationValue - maxWidth * 0.1) / 2),
      left: -150.0 + (animationValue - maxWidth * 0.1),
    );
  }

  static CloudPosition CloudBottomRightMath(
    double maxWidth,
    double maxHeigh,
    double factor,
    double animationValue,
  ) {
    return CloudPosition(
      bottom: -70.0 + (animationValue / 2),
      right: -200.0 + animationValue,
    );
  }
}
