class CloudPosition {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  CloudPosition({this.left, this.top, this.bottom, this.right});
}

class AppBoundriesDetails {
  static late double maxWidth;
  static late double maxHeight;
  static late double factor;

  static double bottomCloudStartOffsetBottom() {
    return 0.15 * maxWidth; //60
  }

  static double calculateHorizontalOffset() {
    return 0.5 * maxWidth; //200
  }

  static double animatedCloudsStartOffsetLeftRight() {
    return 2 * maxWidth;
  }

  static void initialize({
    required double maxWidth,
    required double maxHeight,
    required double factor,
  }) {
    AppBoundriesDetails.maxWidth = maxWidth;
    AppBoundriesDetails.maxHeight = maxHeight;
    AppBoundriesDetails.factor = factor;
  }
}

class CloudFormula {
  static CloudPosition cloud1Math(double animationValue) {
    return CloudPosition(
      top: AppBoundriesDetails.maxHeight * AppBoundriesDetails.factor,
      left:
          AppBoundriesDetails.animatedCloudsStartOffsetLeftRight() *
              animationValue -
          AppBoundriesDetails.maxWidth * 0.765,
    );
  }

  static CloudPosition cloud2Math(double animationValue) {
    return CloudPosition(
      top: AppBoundriesDetails.maxHeight * (AppBoundriesDetails.factor + 0.05),
      right:
          AppBoundriesDetails.animatedCloudsStartOffsetLeftRight() *
              animationValue -
          (AppBoundriesDetails.maxWidth * 0.765),
    );
  }

  static CloudPosition cloud3Math(double animationValue) {
    return CloudPosition(
      top: AppBoundriesDetails.maxHeight * (AppBoundriesDetails.factor + 0.1),
      left:
          AppBoundriesDetails.animatedCloudsStartOffsetLeftRight() *
              animationValue -
          AppBoundriesDetails.maxWidth * 0.765,
    );
  }

  static CloudPosition cloudBottomLeftMath(double animationValue) {
    return CloudPosition(
      bottom:
          -AppBoundriesDetails.bottomCloudStartOffsetBottom() +
          ((animationValue) / 2),
      left: -AppBoundriesDetails.calculateHorizontalOffset() + (animationValue),
    );
  }

  static CloudPosition cloudBottomRightMath(double animationValue) {
    return CloudPosition(
      bottom:
          -AppBoundriesDetails.bottomCloudStartOffsetBottom() +
          (animationValue / 2),
      right: -AppBoundriesDetails.calculateHorizontalOffset() + animationValue,
    );
  }
}
