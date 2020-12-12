import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'Models/choiceButton.dart';
import 'Models/userBar.dart';
import 'constants.dart';
import 'homePage.dart';

class GamePage extends StatefulWidget {
  String mode;

  GamePage({Key key, this.mode}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String _gameMode;
  String _player1Choice,
      _player2Choice,
      _playerWins; //Player1 = Computer 1, Player2 = Computer 2 or Player//
  int _time = 5;
  int _getReadyTime = 3;
  bool _getReady = true;
  bool _evaluateDialog = false;
  double _percent = 1;
  Timer _gameStartDialogTimer, _timer;
  List<String> choice = ['Rock','Paper','Scissors']; //[0] = Rock, [1] = Paper, [2] Scissors//

  //Method for new game//
  void newGame() {
    setState(() {
      _time = 5;
      _percent = 5.0;
      _player2Choice = null;
      _player1Choice = null;
      _evaluateDialog = false;
    });
    _timer.cancel();
    countdownTimer();
  }
  //Timer for dialog to get ready//
  void gameStartDialog() {
    _gameStartDialogTimer = Timer.periodic(
        Duration(seconds: 1),
        (timer) => setState(() {
              if (_getReadyTime < 1) {
                _gameStartDialogTimer.cancel();
                _getReady = false;
                countdownTimer();
              } else {
                _getReadyTime = _getReadyTime - 1;
              }
            }));
  }
  //Timer for game countdown (5secs)//
  void countdownTimer() {
    randomChoice('Computer 1');
    if (_gameMode == 'Computer 2') {
      randomChoice('_computer2Choice');
    }
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) => setState(() {
              if (_time < 1) {
                _timer.cancel();
                evaluateResult(_player2Choice, _player1Choice);
              } else {
                _time = _time - 1;
                _percent = (_time / 5).toDouble();
              }
            }));
  }
  //Method for computer to randomly choose move//
  void randomChoice(String player) {
    var rdm = Random();
    setState(() {
      if (player == 'Computer 1') {
        _player1Choice = choice[rdm.nextInt(3)];
      } else if (player == '_computer2Choice') {
        _player2Choice = choice[rdm.nextInt(3)];
      }
    });
  }

  @override
  void initState() {
    _gameMode = widget.mode;
    gameStartDialog();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _gameStartDialogTimer.cancel();
    super.dispose();
  }

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
                stops: [
              0.1,
              0.5,
              0.9
            ],
                colors: [
              Color.fromRGBO(0, 4, 40, 1),
              Color.fromRGBO(0, 78, 146, 1),
              Color.fromRGBO(0, 4, 40, 1)
            ])),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              child: (_gameMode == 'Computer 2')
                  ? userBar('Computer 1')
                  : userBar('Computer'),
            ),
            Spacer(),
            _getReady
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _evaluateDialog
                          ? (_player1Choice == choice[2])
                              ? choiceButton(choice[2])
                              : Container()
                          : choiceButton(choice[2]),
                      _evaluateDialog
                          ? (_player1Choice == choice[1])
                              ? choiceButton(choice[1])
                              : Container()
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: choiceButton(choice[1])),
                      _evaluateDialog
                          ? (_player1Choice == choice[0])
                              ? choiceButton(choice[0])
                              : Container()
                          : choiceButton(choice[0]),
                    ],
                  ),
            Spacer(),
            Center(
              child: _getReady
                  ? Container(
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepOrangeAccent,
                                Colors.amberAccent
                              ]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            )
                          ]),
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            Text('Game starts in',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: fontColor)),
                            Text(_getReadyTime.toString(),
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: fontColor)),
                          ])),
                    )
                  : _evaluateDialog
                      ? evaluateDialog(widget.mode, _playerWins)
                      : Stack(alignment: Alignment.center, children: [
                          ShaderMask(
                              shaderCallback: (boundary) {
                                return SweepGradient(
                                    startAngle: 0,
                                    endAngle: 3.14 * 2,
                                    stops: [_percent, _percent],
                                    center: Alignment.center,
                                    colors: [
                                      Colors.black,
                                      Colors.transparent
                                    ]).createShader(boundary);
                              },
                              child: Container(
                                height: screenHeight * 0.15,
                                width: screenHeight * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              )),
                          Container(
                            height: screenHeight * 0.13,
                            width: screenHeight * 0.13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  stops: [0.6, 0.9],
                                  colors: [
                                    Colors.amberAccent,
                                    Colors.deepOrangeAccent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                _time.toString(),
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: fontColor),
                              ),
                            ),
                          ),
                        ]),
            ),
            Spacer(),
            _getReady
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _evaluateDialog
                          ? (_player2Choice == choice[0])
                              ? choiceButton(choice[0])
                              : Container()
                          : (_gameMode == 'Computer 2')
                              ? choiceButton(choice[0])
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      _player2Choice = choice[0];
                                    });
                                  },
                                  child: choiceButton(choice[0]),
                                ),
                      _evaluateDialog
                          ? (_player2Choice == choice[1])
                              ? choiceButton(choice[1])
                              : Container()
                          : (_gameMode == 'Computer 2')
                              ? choiceButton(choice[1])
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      _player2Choice = choice[1];
                                    });
                                  },
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: choiceButton(choice[1])),
                                ),
                      _evaluateDialog
                          ? (_player2Choice == choice[2])
                              ? choiceButton(choice[2])
                              : Container()
                          : (_gameMode == 'Computer 2')
                              ? choiceButton(choice[2])
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      _player2Choice = choice[2];
                                    });
                                  },
                                  child: choiceButton(choice[2]),
                                ),
                    ],
                  ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              child: (_gameMode == 'Computer 2')
                  ? userBar('Computer 2')
                  : userBar(widget.mode),
            ),
          ],
        ),
      ),
    );
  }

  //Evaluation method//
  void evaluateResult(String _player2Choice, String _player1Choice) {
    if (_player2Choice == null) {
      setState(() {
        _evaluateDialog = true;
        _playerWins = null;
      });
    } else if (_player2Choice == _player1Choice) {
      //Player or Computer 2 Draw//
      setState(() {
        _evaluateDialog = true;
        _playerWins = 'draw';
      });
    } else if (_player2Choice == choice[0] && _player1Choice == choice[1]) {
      //Player or Computer 2 Lose//
      setState(() {
        _evaluateDialog = true;
        _playerWins = 'lose';
      });
    } else if (_player2Choice == choice[1] && _player1Choice == choice[2]) {
      //Player or Computer 2 Lose//
      setState(() {
        _evaluateDialog = true;
        _playerWins = 'lose';
      });
    } else if (_player2Choice == choice[2] && _player1Choice == choice[0]) {
      //Player or Computer 2 Lose//
      setState(() {
        _evaluateDialog = true;
        _playerWins = 'lose';
      });
    } else {
      //Player or Computer 2 Win//
      setState(() {
        _evaluateDialog = true;
        _playerWins = 'win';
      });
    }
  }

  //Dialog for evaluation//
  evaluateDialog(String name, String playerWins) {
    return Container(
      width: screenWidth * 0.6,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          color: Colors.amberAccent,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.2,
                0.5,
                0.8
              ],
              colors: [
                Colors.orangeAccent,
                Colors.white,
                Colors.orangeAccent
              ])),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (playerWins == 'win')
                ? Text('$name Wins!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: fontColor))
                : (playerWins == 'lose')
                    ? Text('$name Lose!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: fontColor))
                    : (playerWins == 'draw')
                        ? Text('Draw!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: fontColor))
                        : (playerWins == null)
                            ? Text('Please choose a move!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: fontColor))
                            : Container(),
            Row(
              children: [
                InkWell(
                  onTap: () => newGame(),
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                        child: Text('Try Again',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: fontColor))),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage())),
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                        child: Text('Change Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: fontColor))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
