
class BaseModel {
  int code;
  dynamic data;
  String msg;
  String token;
  int total;

  BaseModel({this.code,this.data,this.msg,this.token = "",this.total = 0});

  BaseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    msg = json['msg'];
    token = json['token'];
    total = json['total'];
  }
}