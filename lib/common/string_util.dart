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
}
