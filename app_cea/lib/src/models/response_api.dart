import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? status;
  int? code;
  String? message;
  dynamic data;

  ResponseApi({
    this.status,
    this.code,
    this.message,
    this.data
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    try{
      data = json['data'];
    }catch(e){
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data
  };
}