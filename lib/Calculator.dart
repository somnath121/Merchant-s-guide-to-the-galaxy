import 'package:flutter/foundation.dart';
import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/Unit.dart';
import 'package:merchant/Utils/InputParser.dart';

class Calculator
{
  static List<Unit> units = <Unit>[];
  static List<Question> questions = <Question>[];
  static List<Metal> metals = <Metal>[];

  static List<String> calculateAnswers(List<String> input)
  {
    InputParser inputParser = InputParser();
    questions = inputParser.getQuestions(input);
    units = inputParser.getUnits(input);
    metals = inputParser.getMetals(input, units);
    List<String> answers = <String>[];
    for (Question question in questions) {
      String? answer = question.calculateAns(units, metals);
      if (answer != null) {
        answers.add(answer);
      }

    }
    if (kDebugMode) {
      print(answers);
    }
    return answers;
  }
}