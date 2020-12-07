import 'package:flutter/material.dart';
import '../constants.dart';

buttonModel(String name){
  return Container(
    width: screenWidth * 0.7,
    height: screenHeight*0.06,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepOrangeAccent,
              Colors.amberAccent
            ]),
        boxShadow: [BoxShadow(
          color: Colors.red.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 2,
          offset: Offset(0, 0),
        )]
    ),
    child: Center(
      child: Text(name, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: fontColor
      )),
    ),
  );
}