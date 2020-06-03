import 'package:boothAlgorithm/functions/boothAlgo.dart';
import 'package:boothAlgorithm/functions/result.dart';
import 'package:flutter/material.dart';
class BuildTable extends StatelessWidget {
  final Result _result;
  BuildTable(this._result);
  @override
  Widget build(BuildContext context) {
    return Table(children:[
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
      TableRow(children:[
            Text(_result.A,style: TextStyle(color:Colors.white),),
            Text(_result.Q,style: TextStyle(color:Colors.white),),
            Text(_result.Q_1,style: TextStyle(color:Colors.white),),
            Text(Result.M,style: TextStyle(color:Colors.white),),
            Text(_result.operation,style: TextStyle(color:Colors.white),),
            Text(_result.cycle.toString(),style: TextStyle(color:Colors.white),),
      ]),
       
    ],);
  }
}