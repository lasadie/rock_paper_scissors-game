import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/gamePage.dart';
import 'package:rock_paper_scissors/settings.dart';
import 'Models/buttonModel.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.9],
              colors: [
                Color.fromRGBO(0, 4, 40, 1),
                Color.fromRGBO(0, 78, 146, 1),
                Color.fromRGBO(0, 4, 40, 1)
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight*0.2, left: screenWidth*0.05, right: screenWidth*0.05),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Rock Paper Scissors',
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        shadows: [Shadow(
                          color: Colors.red,
                          blurRadius: 8,
                          offset: Offset(0, 0)
                        )],
                        foreground: Paint()..shader = textLinearGradient)),
              ),

          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight*0.15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GamePage(mode:'Player')));
              },
              child: buttonModel('Player vs Computer'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight*0.05),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> GamePage(mode:'Computer 2')));
              },
              child: buttonModel('Computer vs Computer'),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: screenWidth*0.05, right: screenWidth*0.05, left: screenWidth*0.05),
            child: Container(
                alignment: Alignment.centerRight,
                width: screenWidth,
                child: Row(
                  children: [
                    Text('Version 1.0', style: TextStyle(
                      color: Colors.amberAccent,
                      fontStyle: FontStyle.italic
                    )),
                    Spacer(),
                    InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage())),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.amberAccent, size: 35),
                    child: Icon(Icons.settings)
                    ),
                  ),
                  ]
                ),
              ),
          )
        ],
      ),
    ));
  }

}
