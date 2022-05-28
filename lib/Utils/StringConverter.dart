import 'package:merchant/Model/Unit.dart';

abstract class StringConvertor {
  String convert(String input, String delim, List<Unit> units);
}
