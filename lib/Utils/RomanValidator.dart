
class RomanValidator {

  static bool isValidRoman(String roman) {
    List<String> arr = ["IL", "IC", "ID", "IM", "XD", "XM"];
    List<String> threetimes = ["IIII", "XXXX", "CCCC", "MMMM"];
    List<String> norepetition = ["D", "L", "V"];
    for (String string in threetimes) {
      if (roman.contains(string)) {
        return false;
      }
    }
    for (String string in arr) {
      if (roman.contains(string)) {
        return false;
      }
    }
    String romanCharset = "IVXLCDM";
    for (String string in norepetition) {
      String newRomanCharSet = romanCharset.replaceAll(string, "");

      var pattern1 = "[$newRomanCharSet]*$string[$newRomanCharSet]*";
      final regExp1 = RegExp(pattern1, caseSensitive: false);
      bool matchCond1 = regExp1.hasMatch(roman);

      var pattern2 = "[$newRomanCharSet]*";
      final regExp2 = RegExp(pattern2, caseSensitive: false);
      bool matchCond2 = regExp2.hasMatch(roman);

      if ( !(matchCond1 || matchCond2)) {
        return false;
      }
    }
    return true;
  }
}
