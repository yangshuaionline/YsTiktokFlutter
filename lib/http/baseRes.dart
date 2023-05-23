
class BaseRes{
  late int code;
  late String message;
  late dynamic data;
  BaseRes(this.code,this.message,this.data);
  factory BaseRes.fromMap(Map map){
    var code = map["code"];
    var message = map["message"];
    var data = map["data"];
    return BaseRes(code, message, data);
  }
}