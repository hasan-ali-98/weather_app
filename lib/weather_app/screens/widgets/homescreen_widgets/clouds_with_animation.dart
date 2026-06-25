import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../cloud_position_manager.dart';
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
              cloudMathFormula: cloudFormula.Cloud1Math,
              maxWidth: maxWidth,
              maxHeigh: maxHeight,
              factor: topSpaceFactor,

              cloudAnimation: topCloudAnimation1,
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud1,
              ),
            ),

            CloudObject(
              cloudMathFormula: cloudFormula.Cloud2Math,
              factor: topSpaceFactor,
              maxWidth: maxWidth,
              maxHeigh: maxHeight,

              cloudAnimation: topCloudAnimation1,
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud2,
              ),
            ),

            CloudObject(
              cloudMathFormula: cloudFormula.Cloud3Math,
              factor: topSpaceFactor,
              maxWidth: maxWidth,
              maxHeigh: maxHeight,

              cloudAnimation: topCloudAnimation1,
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud3,
              ),
            ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(color: Colors.white.withAlpha(35)),
            ),
            CloudObject(
              cloudMathFormula: cloudFormula.CloudBottomLeftMath,
              factor: topSpaceFactor,
              maxWidth: maxWidth,
              maxHeigh: maxHeight,

              cloudAnimation: bottomCloudAnimation,
              child: CloudImage(
                maxWidth: maxWidth,
                imageName: AppConstants.cloud3,
              ),
            ),

            CloudObject(
              cloudMathFormula: cloudFormula.CloudBottomRightMath,
              factor: topSpaceFactor,
              maxWidth: maxWidth,
              maxHeigh: maxHeight,

              cloudAnimation: bottomCloudAnimation,
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
