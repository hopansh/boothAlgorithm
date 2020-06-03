decToBin(int dValue) {
  int binaryValue = 0;
  int i = 1;
  int decimalValue = 0;
  if (dValue >= 0) {
    decimalValue = dValue;
  } else {
    decimalValue = -dValue;
  }
  while (decimalValue > 0) {
    binaryValue = binaryValue + (decimalValue % 2) * i;
    decimalValue = (decimalValue / 2).floor();
    i = i * 10;
  }
  if (dValue > 0) {
    return binaryValue.toString();
  } else {
    String str = binaryValue.toString();
    int n = str.length;

    int i;
    for (i = n - 1; i > 0; i--) if (str[i] == '1') break;
    if (i == -1) return "1" + str;
    {
      for (int k = i - 1; k >= 0; k--) {
      if (str[k] == '1')
        str=str.replaceRange(k, k + 1, "0");
      else
        str=str.replaceRange(k, k + 1, "1");}
    }
    return str;
  }
}
