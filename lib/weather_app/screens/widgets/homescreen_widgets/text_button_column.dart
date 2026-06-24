import 'package:flutter/material.dart';

import '../../../constants.dart';

Column buildTextandButtonColumn(Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(child: Container()),
      Text("Weather", style: textStyle.copyWith(fontWeight: FontWeight.bold)),
      Text("Forecast", style: textStyle.copyWith(fontSize: 60)),

      SizedBox(height: 40),
      Container(
        width: size.width / 1.6,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff384DDD), Color(0xff657CF6)],
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(62),
        ),
        child: Center(
          child: Text("Get Started", style: textStyle.copyWith(fontSize: 26)),
        ),
      ),

      SizedBox(height: 15),
      Text(
        "create an account",
        style: textStyle.copyWith(
          fontSize: 20,
          fontFamily: "Arial",
          color: Color(0xff384EDE),
        ),
      ),
      SizedBox(height: 170),
    ],
  );
}
