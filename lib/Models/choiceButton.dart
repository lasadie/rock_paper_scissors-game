import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/constants.dart';

choiceButton(String choice){
  return Container(
      height: screenHeight*0.15,
      width: screenHeight*0.15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
    child: Image.asset('assets/images/$choice.png'),
    );

}