import 'package:merchant/Model/Unit.dart';
import 'package:merchant/Utils/StringConverter.dart';

class RomanConverter with StringConvertor {

  @override
  String convert(String input, String delim, List<Unit> units) {
    String romanString = "";
    List<String> splitedInput = input.split(delim);
    for (String string in splitedInput) {
      for (Unit unit in units) {
        if (unit.getOtherValue() == string) {
          romanString = (romanString + unit.getRomanValue());
          break;
        }
      }
    }
    return romanString;
  }
}
