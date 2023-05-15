

///限制11位数字
const number11 = r"^\d{0,11}$";
///是否为手机号码
bool isPhone(String input){
  final RegExp test  = RegExp(r'1\d{10}');
  return test.hasMatch(input);
}
///是否为验证码
bool isVerificationCode(String input){
  final RegExp test  = RegExp(r'\d{6}$');
  return test.hasMatch(input);
}