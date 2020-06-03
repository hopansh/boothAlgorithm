import 'package:flutter/material.dart';
class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar= AppBar(
        title:Text("Algorithm Flow Chart",style:TextStyle(color: Colors.white)),
      );
    return Scaffold(
      appBar:appBar,
      backgroundColor: Colors.white,
      body: Container(
        
        color: Colors.white,
        height:MediaQuery.of(context).size.height-appBar.preferredSize.height,
        child: Image.asset("assets/images/alualgo.png",fit:BoxFit.contain),
      ),
    );
  }
}