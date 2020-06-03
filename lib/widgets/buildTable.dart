import 'package:boothAlgorithm/functions/boothAlgo.dart';
import 'package:flutter/material.dart';
class BuildTable extends StatelessWidget {
  final String binqval,binmval;
  BuildTable(this.binqval,this.binmval);
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
            Text("0000",style: TextStyle(color:Colors.white),),
            Text("$binqval",style: TextStyle(color:Colors.white),),
            Text("0000",style: TextStyle(color:Colors.white),),
            Text("$binmval",style: TextStyle(color:Colors.white),),
            Text("Initial Values",style: TextStyle(color:Colors.white),),
            Text("-",style: TextStyle(color:Colors.white),),
      ]),
       
    ],);
  }
}