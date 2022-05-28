import 'package:merchant/Model/RomanDigits.dart';
import 'package:merchant/Utils/NumberConverter.dart';
import 'package:merchant/Utils/RomanValidator.dart';

class RomanToDecimalConverter with NumberConvertor {

  @override
  int convert(String input) {
    if (RomanValidator.isValidRoman(input)) {
      List<int> intInput = toIntArray(input);
      int val = 0;
      for (int i = 0; i < intInput.length; i++) {
        if ((i > 0) && ((intInput[i - 1] < intInput[i]))) {
          val = ((val + intInput[i]) - (2 * intInput[i - 1]));
        } else {
          val = (val + intInput[i]);
        }
      }
      return val;
    } else {
      return 0;
    }
  }

  static List<int> toIntArray(String input) {
    var intArray = <int>[];
    for (int i = 0; i < input.length; i++) {

      var value = RomanDigits.convertToValue(input[i].toString());
      intArray.insert(i, value);
    }
    return intArray;
  }
}
