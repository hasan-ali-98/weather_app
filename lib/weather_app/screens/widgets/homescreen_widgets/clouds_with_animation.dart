import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'cloud_animted_object.dart';
import 'cloud_image.dart';

class AnimatedClouds extends StatelessWidget {
  const AnimatedClouds({
    super.key,
    required this.topSpaceFactor,
    required this.topCloudAnimation1,

    required this.topCloudAnimation2,

    required this.bottomCloudAnimation,
  });

  final double topSpaceFactor;
  final Animation<double> topCloudAnimation1;

  final Animation<double> topCloudAnimation2;

  final Animation<double> bottomCloudAnimation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        return Stack(
          children: [
            CloudObject(
              top: () {
                return maxHeight * topSpaceFactor;
              },
              left: () {
                return 2 * maxWidth * topCloudAnimation1.value -
                    maxWidth * 0.765;
              },

              cloudAnimation: topCloudAnimation1,
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud1,
              ),
            ),

            CloudObject(
              top: () {
                return maxHeight * (topSpaceFactor + 0.05);
              },

              right: () {
                return 2 * maxWidth * topCloudAnimation1.value -
                    maxWidth * 0.765;
              },
              cloudAnimation: topCloudAnimation2,
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud2,
              ),
            ),

            CloudObject(
              cloudAnimation: topCloudAnimation1,

              top: () {
                return maxHeight * (topSpaceFactor + 0.1);
              },
              left: () {
                return 2 * maxWidth * topCloudAnimation1.value -
                    maxWidth * 0.765;
              },

              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud3,
              ),
            ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(color: Colors.white.withAlpha(35)),
            ),

            // left cloud
            CloudObject(
              cloudAnimation: bottomCloudAnimation,

              left: () {
                return -150.0 + (bottomCloudAnimation.value - maxWidth * 0.1);
              },

              bottom: () {
                return -40.0 +
                    ((bottomCloudAnimation.value - maxWidth * 0.1) / 2);
              },
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud3,
              ),
            ),
            CloudObject(
              cloudAnimation: bottomCloudAnimation,

              right: () {
                return -200.0 + bottomCloudAnimation.value;
              },
              bottom: () {
                return -70.0 + (bottomCloudAnimation.value / 2);
              },

              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud3,
              ),
            ),
          ],
        );
      },
    );
  }
}
