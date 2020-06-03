import 'package:boothAlgorithm/functions/boothAlgo.dart';
import 'package:boothAlgorithm/functions/decToBin.dart';
import 'package:boothAlgorithm/widgets/buildTable.dart';

import 'package:flutter/material.dart';

class Solution extends StatelessWidget {
  final height;
  final int qval, mval;
  Solution(this.height, this.qval, this.mval);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final binqval=decToBin(qval);
    final binmval=decToBin(mval);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Booth Multiplication"),
      ),
      body: Container(
        height: height,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: height * 0.1,
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xff262626),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Q: \t$qval\t( Bin: $binqval )",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "M: \t$mval\t( Bin: $binmval )",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
                Container(height:height*0.12,
                width: width,
                margin: EdgeInsets.symmetric(vertical:10,horizontal:5),
                padding: EdgeInsets.symmetric(horizontal:10,vertical:15),
                decoration: BoxDecoration(
                    color: Color(0xff262626),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                    child:BuildTable(binqval, binmval)
                    // Text("table here"),
                    ),
          ],
        ),
      ),
    );
  }
}