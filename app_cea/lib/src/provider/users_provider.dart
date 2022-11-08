import 'dart:convert';

import 'package:app_cea/src/api/environment.dart';
import 'package:app_cea/src/models/response_api.dart';
import 'package:app_cea/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsersProvider{
  SharedPreferences? sharedPreferences;
  BuildContext? context;
  String _url = Environment.API_CEA;
  String _api = '/api/admin';

  Future? init(BuildContext context){
    this.context = context;
  }

  Future<ResponseApi> login(User user) async{

    Uri url = Uri.http(_url, '$_api/login');
    String bodyParams = json.encode(user);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Charset':'utf-8',
      'Accept':'application/json',
      'connection': 'keep-alive',
      'Accept-Encoding' : 'gzip, deflate, br',
    };

    final res = await http.post(url, headers: headers, body: bodyParams);
    String parseData = res.body.toString();
    final data = jsonDecode(parseData);

    ResponseApi responseApi = ResponseApi.fromJson(data);

    return responseApi;

  }

  Future<ResponseApi> register(User user) async{
    SharedPreferences cache = await SharedPreferences.getInstance();
    dynamic token = cache.getString("token");

    Uri url = Uri.http(_url, '$_api/users/register');
    String bodyParams = json.encode(user);

    print(bodyParams);

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Charset':'utf-8',
      'Accept':'application/json',
      'Authorization':'$token',
      'connection': 'keep-alive',
      'Accept-Encoding' : 'gzip, deflate, br',
    };

    final res = await http.post(url, headers: headers, body: bodyParams);
    String parseData = res.body.toString();
    final data = jsonDecode(parseData);

    ResponseApi responseApi = ResponseApi.fromJson(data);

    return responseApi;

  }
}