import 'package:bloot_calc/bloot.dart';
import 'package:bloot_calc/calc.dart';
import 'package:bloot_calc/menu.dart';
// import 'package:bloot_calc/settings.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<Start> createState() {
    return _StartState();
  }
}

class _StartState extends State<Start> {
  var activeScreen = "menu-screen";

  void where(int f) {
    if (f == 0) {
      setState(() {
        activeScreen = "calc-screen";
      });
    } else if (f == 1) {
      setState(() {
        activeScreen = "menu-screen";
      });
    } else if (f == 2) {
      setState(() {
        activeScreen = "settings-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Menu(where);

    if (activeScreen == "calc-screen") {
      screenWidget = Bloot(where);
    } else if (activeScreen == "settings-screen") {
      screenWidget = Calc(where);
    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
