

import 'package:buyfresh/Login.dart';
import 'package:buyfresh/splash.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
    debugShowCheckedModeBanner: false,
      home:Splash()
    );
  }
}
