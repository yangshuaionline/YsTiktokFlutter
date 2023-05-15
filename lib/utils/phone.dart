
///手机号验证
bool validateChinesePhoneNumber(String phoneNumber) {
  RegExp regExp = RegExp(r'^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$');
  return regExp.hasMatch(phoneNumber);
}