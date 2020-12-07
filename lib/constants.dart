import 'package:flutter/material.dart';

//Device screen-height and screen-width//
double screenHeight;
double screenWidth;

final Color fontColor = Colors.blue[900];

//Shader to make gradient text//
final Shader textLinearGradient = LinearGradient(
  colors: <Color>[Colors.deepOrangeAccent, Colors.amberAccent],
).createShader(Rect.fromLTWH(0.0, 0.0, screenWidth, screenHeight*0.1));


