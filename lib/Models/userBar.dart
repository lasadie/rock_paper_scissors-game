import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/constants.dart';

userBar(String name){
  return Container(
    width: screenWidth*0.85,
    height: screenHeight *0.07,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
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
      child: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: fontColor)),
    ),
  );
}