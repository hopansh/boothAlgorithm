import 'package:boothAlgorithm/functions/boothAlgo.dart';
import 'package:boothAlgorithm/functions/result.dart';
import 'package:boothAlgorithm/widgets/buildTable.dart';

import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  final height;
  final int qval, mval;

  Solution(this.height, this.qval, this.mval);

  @override
  _SolutionState createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final binqval = binary(widget.qval).join('');
    final binmval = binary(widget.mval).join('');

    List<Result> results = mult(widget.qval, widget.mval);
    results.forEach((element) {element.toString();});
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Booth Multiplication"),
      ),
      body: Container(
        height: widget.height,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: widget.height * 0.1,
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
                      "Q: \t${widget.qval}\t( Bin: $binqval )",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "M: \t${widget.mval}\t( Bin: $binmval )",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ],

                )),

              Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: Color(0xff262626),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Table(children:[
         TableRow(children: 
      [
          Text("A",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
          Text("Q",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
          Text("Q-1",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
          Text("M",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
          Text("Process",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
          Text("Cycle",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
      ]
      ),
      ])
  ),
            ListView.builder(
              shrinkWrap: true,
                itemBuilder: (context,index) => getTable(results[index]),
                itemCount: results.length,
            )
          ],
        ),
      ),
    );
  }
}

Widget getTable(Result r){
  return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
      decoration: BoxDecoration(
          color: Color(0xff262626),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: BuildTable(r)
  );
}
