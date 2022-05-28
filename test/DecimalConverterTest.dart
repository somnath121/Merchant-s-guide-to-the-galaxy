import 'package:flutter_test/flutter_test.dart';
import 'package:merchant/Utils/RomanToDecimalConverter.dart';

  void main() {
    List<String> input = ["XX", "MCMXLIV", "IV", "MMVI"];
    List<int> expectedOutput = [20, 1944, 4, 2006];
    test("KJH", () {
      try {
        RomanToDecimalConverter().convert("KJH");
      } on Exception catch (_) {
        expect("exception", "Invalid Roman");
      }
    });

    test("IIIIXV", () {
      try {
        RomanToDecimalConverter().convert("IIIIXV");
      } on Exception catch (_) {
        expect("exception", "Invalid Roman");
      }
    });

    test("XDD", () {
      try {
        RomanToDecimalConverter().convert("XDD");
      } on Exception catch (_) {
        expect("exception", "Invalid Roman");
      }
    });

    test("Expected ", () {
      for (int i = 0; i < input.length; i++) {
        int val = RomanToDecimalConverter().convert(input[i]);
        expect(val, expectedOutput[i]);
      }
    });
  }
