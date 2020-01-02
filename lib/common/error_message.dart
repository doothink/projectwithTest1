class ErrorMessage {
  static String getValue(int errorCode) {
    switch (errorCode) {
      case 500100:
        return "아이디 또는 비밀번호가 일치하지 않습니다.";
      case 500705:
        return "인증번호가 일치하지 않습니다";
      case 500200:
        return "비밀번호는 필수항목 입니다.";
      case 500201:
        return "비밀번호는 필수항목 입니다.";
      case 500202:
        return "비밀번호가 일치하지 않습니다";
      case 500205:
        return "이미 존재하는 이메일 입니다.";
      case 500206:
        return "올바른 이메일 형식이 아닙니다.";
      case 500207:
        return "비밀번호는 숫자,영소문자.영대문자가 포함된 8자리 이상입력 해야 합니다.";
      case 500208:
        return "비밀번호확인은 숫자,영소문자.영대문자가 포함된 8자리 이상입력 해야 합니다.";
      case 500209:
        return "비밀번호가 일치하지 않습니다.";
      default:
        return "";
    }
  }
}
