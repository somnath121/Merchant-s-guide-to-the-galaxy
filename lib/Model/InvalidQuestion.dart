import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/Unit.dart';

class InvalidQuestion with Question {
  String question;

  InvalidQuestion(this.question);

  @override
  String? calculateAns(List<Unit> units, List<Metal> metals) {
    return "I have no idea what you are talking about";
  }
}
