import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/Unit.dart';
import 'package:merchant/QuestionFactory.dart';
import 'package:merchant/Utils/MetalValidator.dart';
import 'package:merchant/Utils/QuestionValidator.dart';
import 'package:merchant/Utils/RomanConverter.dart';
import 'package:merchant/Utils/RomanToDecimalConverter.dart';
import 'package:merchant/Utils/UnitValidator.dart';

class InputParser {
  List<Question> getQuestions(List<String> input) {
    List<Question> questions = <Question>[];
    for (String string in input) {
      if (QuestionValidator.isCorrectQuestion(string)) {
        questions.add(QuestionFactory.getQuestion(string));
      }
    }
    return questions;
  }

  List<Unit> getUnits(List<String> input) {
    List<Unit> units = <Unit>[];
    for (String string in input) {
      if (UnitValidator.isCorrectUnit(string)) {
        units.add(Unit(string.split(" ")[0], string.split(" ")[2]));
      }
    }
    return units;
  }

  List<Metal> getMetals(List<String> input, List<Unit> units) {
    List<Metal> metals = <Metal>[];
    for (String string in input) {
      if (MetalValidator.isCorrectMetal(string)) {
        metals.add(getMetalObject(string, units));
      }
    }
    return metals;
  }

  Metal getMetalObject(String input, List<Unit> units) {
    List<String> splitedString = input.split(" ");
    String name = splitedString[splitedString.length - 4];
    return Metal(name, getMetalValue(input, name, units));
  }

  int getMetalValue(String input, String name, List<Unit> units) {
    List<String> splittedValues = input.split(name);
    int? value1 = RomanToDecimalConverter()
        .convert(RomanConverter().convert(splittedValues[0], " ", units));
    int value2 = int.parse(splittedValues[1].split(" ")[2]);
    print(value2 ~/ value1);
    return value2 ~/ value1;
  }
}
