class UnitValidator {
  static bool isCorrectUnit(String input) {
    return !(input.endsWith("?") || input.endsWith("Credits"));
  }
}
