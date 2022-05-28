import 'package:merchant/Model/CreditQuestion.dart';
import 'package:merchant/Model/InvalidQuestion.dart';
import 'package:merchant/Model/MetalConversionQuestion.dart';
import 'package:merchant/Model/Question.dart';
import 'package:merchant/Model/UnitConversionQuestion.dart';
import 'package:merchant/Utils/QuestionValidator.dart';

class QuestionFactory {
  static Question getQuestion(String question) {
    Question? questionType;
    if (QuestionValidator.isUnitConversionQuestion(question)) {
      questionType = UnitConversionQuestion(question);
    } else {
      if (QuestionValidator.isCreditQuestion(question)) {
        questionType = CreditQuestion(question);
      } else {
        if (QuestionValidator.isMetalConversionQuestion(question)) {
          questionType = MetalConversionQuestion(question);
        } else {
          questionType = InvalidQuestion(question);
        }
      }
    }
    return questionType;
  }
}
