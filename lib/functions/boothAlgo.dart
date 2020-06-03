import 'package:boothAlgorithm/functions/result.dart';

boothAlgo(int m, int q) {
  print("\n\nResult :  $m  * $q  + ${m*q}");
  multiply(3, 4);
}

multiply(int n1, int n2) {
  var m = binary(n1);
  var m1 = binary(-n1);
  final q = binary(n2);
  var a = new List(9);
  var s = new List(9);
  var ac = new List(9);
  for (int i = 0; i < 4; i++) {
    a[i] = m[i];
    s[i] = m1[i];
    ac[i + 4] = q[i];
  }
  print("LOOP  ac    Q     Q-1  Process");
  display(ac, 0, "Initialization");

  for (int i = 0; i < 4; i++) {
    String op = "";
    if (ac[7] == 0 && ac[8] == 0) {
      op = "Skip to Arith. Right Shift";
    } else if (ac[7] == 1 && ac[8] == 0) {
      add(ac, s);
      op = "Subtract";
    } else if (ac[7] == 0 && ac[8] == 1) {
      add(ac, a);
      op = "Add";
    } else if (ac[7] == 1 && ac[8] == 1) {
      op = "Skip to Arith. Right Shift";
    }
    print("");
    display(ac, i + 1, op);
    rightShift(ac);
    display(ac, i + 1, "Arith. Right Shift");
  }
  return getDecimal(ac);
}

binary(final int n) {
  var bin = new List(4);
  bin.fillRange(0, 4,0);
  var binary = n.toSigned( n<0 ? n.bitLength : n.bitLength + 1).toRadixString(2).split('').reversed.toList();
  binary.asMap().forEach((index,value) => bin[index] = value);

  print("Hi");
  List<int> meh = bin.reversed.toList().map((e) => e == '-' ? 0 : int.parse(e.toString())).toList();
  print(bin.toList());
  return meh;
}

mult(int a, int b){

  List<int> m = binary(a);
  List<int> q = binary(b);
  var m2s = m.map((e) => e == 0? 1 : 0).toList();
  m2s = add(m2s,[0,0,0,1]);
  List operation = List();
  operation
      ..insertAll(0, [0,0,0,0])
      ..insertAll(4, q)
      ..insert(8, 0);
  int count = 4;
  List<Result> result = List<Result>();
  while(count > 0){
    String ops = '';
    print("count = $count");
    var q0 = operation[7];
    var q1 = operation[8]; //means q(-1) but who wants to write long variable names
    if(q0.toString() == 1.toString() && q1.toString() == 0.toString()){
      operation = add(operation,m2s);
      ops = ("Sub");
      print(operation);
    }
    else if(q0 == 0 && q1 == 1){
      operation = add(operation,m);
      ops = ("Add");
      print(operation);
    }
    else{
      ops = ("No add/sub");
    }

    operation.insert(0, operation[0]);
    operation.removeLast();
    print(operation);

    try{
      String meh = operation.join('');
      result.add(Result(
          A: meh.substring(0,4),
          Q: meh.substring(4,8),
          Q_1: meh.substring(8),
          operation: ops,
          cycle: 4 - count
      ));
    }catch(e){
      print(e.toString());
    }


    count--;
  }
  result.forEach((element) {element.toString();});

  Result.M = m.join('');
  Result.M2s = m2s.join('');

  return result;
}

display(List p, final int ch, String op) {
  if (op == "Arith. Right Shift")
    print("\n" + " " + "     ");
  else
    print("\n $ch     ");
  for (int i = 0; i < p.length; i++) {
    if (i == 4) print("  ");
    if (i == 8) print("  ");
    print(p[i]);
  }
  print("    " + op);
}

add(List a, List b) {
  int carry = 0;
  for (int i = 3; i >= 0; i--) {
    final int temp = a[i] + b[i] + carry;
    a[i] = temp % 2;
    carry = temp ~/ 2;
  }
  return a;
}

//add(List a,List b){
//  int carry = 0;
//  for(int i = 3; i>=0; --i){
//    a[i] = a[i] + b[i] + carry;
//    carry = a[i] ~/ 2;
//    a[i] = a[i] == 2 ? 0 : a[i];
//    print(a);
//  }
//  return a;
//}

getDecimal(List b) {
  int p = 0;
  int t = 1;
  for (int i = 7; i >= 0; i--, t *= 2) p += (b[i] * t);
  if (p > 64) p = -(256 - p);
  return p;
}

rightShift(List a) {
  for (int i = 8; i >= 1; i--) a[i] = a[i - 1];
}
