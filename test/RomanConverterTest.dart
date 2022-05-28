import 'package:flutter_test/flutter_test.dart';
import 'package:merchant/Model/Unit.dart';
import 'package:merchant/Utils/RomanConverter.dart';

void main() {
  List<String> inadd = [
    "ABC",
    "DEF",
    "GHI",
    "JKL",
    "MNO",
    "PQR",
    "STU",
    "ABC DEF GHI JKL MNO PQR STU",
    "JKL PQR STU",
    "Hi this is test"
  ];

  List<String> expectedOutadd = [
    "I",
    "V",
    "X",
    "L",
    "C",
    "D",
    "M",
    "IVXLCDM",
    "LDM",
    ""
  ];

  List<Unit> units = <Unit>[];
  units.add(Unit("ABC", "I"));
  units.add(Unit("DEF", "V"));
  units.add(Unit("GHI", "X"));
  units.add(Unit("JKL", "L"));
  units.add(Unit("MNO", "C"));
  units.add(Unit("PQR", "D"));
  units.add(Unit("STU", "M"));
  RomanConverter romanConverter = RomanConverter();

  test("Expected Roman Converter", () {
    for (int i = 0; i < inadd.length; i++) {
      String val = romanConverter.convert(inadd[i], " ", units);
      expect(val, expectedOutadd[i]);
    }
  });
}
