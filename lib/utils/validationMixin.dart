class ValidationMixin {
  bool validationEmail(String email) {
    if (!email.contains('@')) {
      return false;
    }
    return true;
  }

//문자, 숫자, 특수문자 포함, 8~16글자
  bool validationPassword(String password) {
    Pattern pattern = r'(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&\*]).{8,16}';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(password)) {
      return false;
    }
    if (password.length < 8 || password.length > 16) {
      return false;
    }
    return true;
  }

//password와 동일한지 확인
  bool validationPasswordCheck(String password, String passwordCheck) {
    if (password != passwordCheck) {
      return false;
    }
    return true;
  }

//숫자만 11자리
  bool validationPhone(String phone) {
    Pattern pattern = r'([\d])+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(phone) || phone.length != 11) {
      return false;
    }
    return true;
  }
}
