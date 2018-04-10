import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lancelot',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: new ProjectBrowsePage(),
      home: new HomePage(),
    );
  }
}

