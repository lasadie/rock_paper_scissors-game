import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/Models/buttonModel.dart';
import 'constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _showbuttons = true;
  bool _howToPlay = false;
  bool _credits = false;

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showbuttons? InkWell(
              onTap: (){
                setState(() {
                  _showbuttons = false;
                  _howToPlay = true;
                });
              },
              child:buttonModel('How To Play')
            ) : _howToPlay?
            //How to play//
            Container(
                height: screenHeight*0.5,
                width: screenWidth*0.7,
                decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _showbuttons = true;
                                  _howToPlay = false;
                                });
                              },
                              child: IconTheme(
                                  data: IconThemeData(size: 30, color: fontColor),
                                  child: Icon(Icons.arrow_back)),
                            ),
                            SizedBox(width: (screenWidth*0.15)),
                            Text('How To Play', style: TextStyle(
                              color: fontColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ))
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text('Moves', style: TextStyle(
                        color: fontColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              children: [
                            Image.asset('assets/images/Rock.png', width: screenWidth*0.1, height: screenWidth*0.1),
                                Text ('Rock', style: TextStyle(
                                  color: fontColor,
                                  fontWeight: FontWeight.bold,
                                ))
                            ]
                          ),
                          Column(
                              children: [
                                Image.asset('assets/images/Paper.png', width: screenWidth*0.1, height: screenWidth*0.1),
                                Text ('Paper', style: TextStyle(
                                  color: fontColor,
                                  fontWeight: FontWeight.bold,
                                ))
                              ]
                          ),
                          Column(
                              children: [
                                Image.asset('assets/images/Scissors.png', width: screenWidth*0.1, height: screenWidth*0.1),
                                Text ('Scissors', style: TextStyle(
                                  color: fontColor,
                                  fontWeight: FontWeight.bold,
                                ))
                              ]
                          ),
                        ],
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Game Modes', style: TextStyle(
                        color: fontColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        width: screenWidth*0.6,
                        child: Text('Player vs Computer\n\nIn this game mode, you will be given 5 seconds to choose a move.\n- Rock wins Scissors\n- Paper wins Rock\n- Scissors wins Paper\n\nComputer vs Computer\n\nIn this game mode, 2 computers will play off against each other with the same rule.\n- Rock wins Scissors\n- Paper wins Rock\n- Scissors wins Paper',
                            style: TextStyle(
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ): _credits?
            //Credits//
            Container(
              height: screenHeight*0.5,
              width: screenWidth*0.7,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _showbuttons = true;
                                  _credits = false;
                                });
                              },
                              child: IconTheme(
                                  data: IconThemeData(size: 30, color: fontColor),
                                  child: Icon(Icons.arrow_back)),
                            ),
                            SizedBox(width: (screenWidth*0.18)),
                            Text('Credits', style: TextStyle(
                              color: fontColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ))
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      child: Text('Rock, Paper and Scissors icons credits to:\nhttps://www.subpng.com/png-8angfn/',
                      style: TextStyle(
                        color: fontColor,
                        fontWeight: FontWeight.bold,),
                      textAlign: TextAlign.justify),
                    )
                  ],
                ),
              ),
            ): Container(),
            SizedBox(height: screenHeight*0.05),
            _showbuttons? InkWell(
              onTap: (){
                setState(() {
                  _showbuttons = false;
                  _credits = true;
                });
              },
              child: buttonModel('Credits'),
            ) : Container(),
            SizedBox(height: screenHeight*0.05),
            _showbuttons? InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: screenWidth * 0.35,
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
                  child: Text('Back', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: fontColor
                    ))

                ),
              ),
            ):Container(),
          ],
        )
      ),
    );
  }
}

