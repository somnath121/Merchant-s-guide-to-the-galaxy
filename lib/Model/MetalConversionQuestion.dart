import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/Unit.dart';
import 'package:merchant/Utils/RomanConverter.dart';
import 'package:merchant/Utils/RomanToDecimalConverter.dart';

class MetalConversionQuestion with Question {
  String question;

  MetalConversionQuestion(this.question);

  @override
  String? calculateAns(List<Unit> units, List<Metal> metals) {
    List<String> splitedQuestion = question.split("how many ");
    List<String> splitedValues = splitedQuestion[1].split(" ");
    String metal1 = splitedValues[0];
    String metal2 = splitedValues[splitedValues.length - 2];
    String unitValue = splitedQuestion[1].replaceAll("$metal1 ", "");
    unitValue = unitValue.replaceAll(metal2, "");
    unitValue = unitValue.replaceAll("is", "");
    unitValue = unitValue.replaceAll(" ?", "");

    String decValue = RomanConverter().convert(unitValue, " ", units);

    int? multiplier = RomanToDecimalConverter().convert(decValue);

    num metal1Val = getMetalValue(metal1, metals);
    num metal2Val = getMetalValue(metal2, metals);
    num multiple = (multiplier * (metal2Val ~/ metal1Val));
    return ("$metal2 is $multiple ") + metal1;
  }

  int getMetalValue(String metal, List<Metal> metals) {
    for (Metal obj in metals) {
      if (obj.getName() == metal.trim()) {
        return obj.getCredit();
      }
    }
    return 0;
  }
}
