import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rock_paper_scissors/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]); //Set full screen(Android's top and bottom bar hidden)//
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) //Set only portrait//
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      home: HomePage(),
    );
  }
}
