import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/Unit.dart';
import 'package:merchant/Utils/RomanConverter.dart';
import 'package:merchant/Utils/RomanToDecimalConverter.dart';

class UnitConversionQuestion with Question {
  String question;

  UnitConversionQuestion(this.question);

  @override
  String? calculateAns(List<Unit> units, List<Metal> metals) {
    String romConvStr = question.split("is ")[1];
    int decValue = RomanToDecimalConverter().convert(RomanConverter().convert(romConvStr, " ", units));
    return "${question.split("is ")[1].substring(0, question.split("is ")[1].indexOf('?'))}is $decValue";
  }
}
