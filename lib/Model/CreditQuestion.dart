import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/Unit.dart';
import 'package:merchant/Utils/RomanConverter.dart';
import 'package:merchant/Utils/RomanToDecimalConverter.dart';

class CreditQuestion with Question {
  String question;

  CreditQuestion(this.question);

  @override
  String? calculateAns(List<Unit> units, List<Metal> metals) {
    List<String> splittedQuestion = question.split("is ");
    List<String> splittedValues = splittedQuestion[1].split(" ");
    String metalName = splittedValues[splittedValues.length - 2];
    int? multiplier = RomanToDecimalConverter()
        .convert(RomanConverter().convert(splittedQuestion[1], " ", units));
    for (Metal metal in metals) {
      if (metal.getName() == metalName) {
        int cred = (metal.getCredit() * multiplier);
        return "${splittedQuestion[1].substring(0,
                        question.split("is ")[1].indexOf('?'))}is $cred Credits";
      }
    }
    return null;
  }
}
