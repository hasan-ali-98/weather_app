import 'package:flutter/material.dart';

import '../../constants.dart';
import '../widgets/homescreen_widgets/clouds_with_animation.dart';
import '../widgets/homescreen_widgets/text_button_column.dart';

class WeatherHomescreen extends StatefulWidget {
  const WeatherHomescreen({super.key});

  @override
  State<WeatherHomescreen> createState() => _WeatherHomescreenState();
}

class _WeatherHomescreenState extends State<WeatherHomescreen>
    with TickerProviderStateMixin {
  late AnimationController topCloudsController, bottomCloudController;

  late Animation<double> topCloudAnimation1,
      topCloudAnimation2,
      bottomCloudAnimation;

  double topSpaceFactor = 0.11;

  @override
  void initState() {
    super.initState();
    var sharedTween = Tween<double>(begin: 0.01, end: 1);
    bottomCloudController = AnimationController(
      vsync: this,
      upperBound: 1,
      lowerBound: 0,
      duration: Duration(milliseconds: 500),
    );

    topCloudsController = AnimationController(
      vsync: this,
      upperBound: 1,
      lowerBound: 0.01,
      duration: Duration(seconds: 8),
    );

    bottomCloudAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: bottomCloudController, curve: Curves.easeOutQuad),
    );

    topCloudAnimation1 = sharedTween.animate(
      CurvedAnimation(parent: topCloudsController, curve: Curves.linear),
    );
    topCloudAnimation2 = sharedTween.animate(
      CurvedAnimation(parent: topCloudsController, curve: Curves.bounceOut),
    );

    topCloudsController.forward();
    bottomCloudController.forward();

    topCloudsController.addStatusListener((status) {
      if (!mounted) return;
      if (status.isCompleted) {
        topSpaceFactor = 0.11;

        topCloudsController.reverse();
      }
      if (status.isDismissed) {
        topSpaceFactor = 0.24;

        topCloudsController.forward();
      }
    });
  }

  @override
  void dispose() {
    topCloudsController.dispose();
    bottomCloudController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
              AppConstants.mainBackGround,
            ),
            AnimatedClouds(
              topSpaceFactor: topSpaceFactor,
              topCloudAnimation1: topCloudAnimation1,

              topCloudAnimation2: topCloudAnimation2,

              bottomCloudAnimation: bottomCloudAnimation,
            ),

            textButtonColumn(size: size),
          ],
        ),
      ),
    );
  }
}
