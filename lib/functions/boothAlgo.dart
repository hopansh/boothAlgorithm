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
  int ctr = 3;
  int num = n;

  if (n < 0) num = 16 + n;
  while (num != 0) {
    bin[ctr--] = num % 2;
    num = num ~/ 2;
  }
  return bin;
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
  for (int i = 8; i >= 0; i--) {
    final int temp = a[i] + b[i] + carry;
    a[i] = temp % 2;
    carry = temp ~/ 2;
  }
}

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
