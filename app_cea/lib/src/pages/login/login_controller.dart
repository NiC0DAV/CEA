import 'package:app_cea/src/models/response_api.dart';
import 'package:app_cea/src/models/user.dart';
import 'package:app_cea/src/pages/home/home_page.dart';
import 'package:app_cea/src/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController {

  BuildContext? context;
  SharedPreferences? sharedPreferences;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context){
    this.context = context;
  }

  registerRoute (BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(
          context,
          'home'
      );
    });
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User user = User(
        correoElectronico: email,
        contrasena: password
    );

    ResponseApi responseApi = await usersProvider.login(user);

    if(responseApi.code == 200 && responseApi != ''){
      SharedPreferences cache = await SharedPreferences.getInstance();
      dynamic token = cache.setString("token", responseApi.data);
      dynamic tokenSaved = cache.getString("token");
      print('Respuesta EXITOSA: ${responseApi.toJson()}\n');
      print('${token}XX-------XX${tokenSaved}');
      if(cache.getString("token") != '' && cache.getString("token") != null){
        Navigator.of(context!).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
      }else{
        print('HUBO UN ERROR NO HAY TOKEN ${token}XX-------XX${tokenSaved}');
      }
    }else{
      print('Respuesta FALLIDA: ${responseApi.toJson()}');
    }

  }

}
