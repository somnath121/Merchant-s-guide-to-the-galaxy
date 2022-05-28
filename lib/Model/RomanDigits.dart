
enum RomanDigits {
  I(1),
  V(5),
  X(10),
  L(50),
  C(100),
  D(500),
  M(1000);

  const RomanDigits(int value) : val = value;
  final int val;

  static int convertToValue(String enumName) {
    var enumValues = RomanDigits.values;
    for (var v in enumValues) {
      if (v.name == enumName) {
        return v.val;
      }
    }
    return 0;
  }
}
