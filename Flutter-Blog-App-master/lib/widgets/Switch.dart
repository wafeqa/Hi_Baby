// ignore: unused_import
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Switch_Button extends StatefulWidget {
  const Switch_Button({Key key}) : super(key: key);

  @override
  _Switch_ButtonState createState() => _Switch_ButtonState();
}

class _Switch_ButtonState extends State<Switch_Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ToggleSwitch(
        totalSwitches: 2,
        labels: ['Boy', 'Girl'],
        fontSize: 20,
        minHeight: 60,
        minWidth: 100,
        cornerRadius: 15,
        icons: [
          FontAwesomeIcons.mars,
          FontAwesomeIcons.venus,
        ],
        iconSize: 20,
        activeBgColor: [Colors.blue, Colors.purple],
        activeFgColor: Colors.white,
      ),
    ));
  }
}
