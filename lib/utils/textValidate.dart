class TextValidate {
  static String _validateString(String value, String regexPattern,
      String regErrorMessage, int minLength) {
    Pattern pattern = regexPattern;
    RegExp regex = new RegExp(pattern);
    String errorMessage;
    if (value.length < minLength) {
      errorMessage = '최소 $minLength자 이상이어야 합니다.';
    } else if (!regex.hasMatch(value)) {
      errorMessage = regErrorMessage;
    } else {
      errorMessage = null;
    }
    return errorMessage;
  }

  static String email(String value) => _validateString(
      value,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      '올바르지 않은 이메일 형식 입니다.',
      4);

  static String userId(String value) =>
      _validateString(value, r'^\S+$', '공백은 사용 할 수 없습니다.', 3);

  static String loginUserId(String value) =>
      _validateString(value, r'^\S+$', '공백은 사용 할 수 없습니다.', 3);

  static String userName(String value) => _validateString(value, r'^.+', '', 2);

  static String masterPassword(String value) => _validateString(
      value,
      r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{6,}$',
      '비밀 번호는 영문, 숫자, 특수문자를 포함해야 합니다.',
      6);

  static String password(String value) => _validateString(value, '', '', 0);
}
