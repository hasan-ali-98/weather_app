import 'package:flutter/material.dart';

class CloudImage extends StatelessWidget {
  const CloudImage({
    super.key,
    required this.maxWidth,
    required this.imageName,
  });

  final double maxWidth;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(width: maxWidth / 1.5, fit: BoxFit.fill, imageName);
  }
}
