import 'package:boothAlgorithm/myhome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booth Algorithm',
      theme: ThemeData(
       primaryColor: Colors.black,
       accentColor: Colors.white,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(),
    );
  }
}