class Result {
  final String A;
  final String Q;
  final String Q_1;
  static String M = '0';
  static String M2s = '0';
  final String operation;
  final int cycle;

  Result({this.A,this.Q,this.Q_1,this.operation,this.cycle});

  @override
  String toString() {
    // TODO: implement toString
    print("A = $A");
    print("Q = $Q");
    print("Q-1 $Q_1");
    print("Operation $operation");
    print("Cycle $cycle");

    return A + Q + Q_1 + operation;
  }
}