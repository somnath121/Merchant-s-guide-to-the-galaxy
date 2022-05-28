
class QuestionValidator {
  static bool isCorrectQuestion(String input) {
    return input.endsWith("?");
  }

  static bool isUnitConversionQuestion(String question) {
    return question.startsWith("how much is");
  }

  static bool isCreditQuestion(String question) {
    return question.startsWith("how many Credits");
  }

  static bool isMetalConversionQuestion(String question) {
    return question.startsWith("how many ");
  }
}
