
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:buyfresh/counter/counterhome.dart';
import 'package:buyfresh/counter/valunteer/valunteerhome.dart';
import 'package:buyfresh/godown/goddownhome.dart';
import 'package:buyfresh/homescreen.dart';
import 'package:buyfresh/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  late SharedPreferences localStorage;
  String user="user";
  String counter="counter";
  String goddown="goddown";
  String volunteer="valunteer";
  String role="";
  late SharedPreferences prefs;

  Future<void> checkRoleAndNavigate() async {
    prefs = await SharedPreferences.getInstance();
    role = (prefs.getString('role') ?? '');
    if (user == role) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homescreen()));
    } else if (counter == role) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => counterhome(),
      ));
    }
    else if (goddown == role) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => goddownhome(),
      ));
    }
    else if (volunteer == role) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => valunteerhome(),
      ));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => login()));
    }
  }


@override
void initState() {
  super.initState();
  startTime();
}

startTime() async {
  var duration = new Duration(seconds: 4);
  return Timer(duration, checkRoleAndNavigate);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
        width: MediaQuery.of(context).size.width,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Padding(
    padding: const EdgeInsets.symmetric(horizontal:30.0),
    child: Image.asset("images/splash.jpeg"),
    ),

    ]
    ),
    ),
    );
  }
}
