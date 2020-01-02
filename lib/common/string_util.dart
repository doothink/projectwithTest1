class StringUtils {
  static String defaultNull(String value) {
    String returnValue = "";
    if (value != null) {
      if (value.length > 0) {
        returnValue = value;
      }
    }

    return returnValue;
  }

  static String runeSubstring(String input, int start, int end) {
    return String.fromCharCodes(input.runes.toList().sublist(start, end));
  }
}
