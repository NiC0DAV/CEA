import 'package:app_cea/src/models/response_api.dart';
import 'package:app_cea/src/models/user.dart';
import 'package:app_cea/src/pages/home/home_page.dart';
import 'package:app_cea/src/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {

  BuildContext? context;
  SharedPreferences? sharedPreferences;
  // TextEditingController emailController = new TextEditingController();
  // TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context){
    this.context = context;
  }

  registerRoute (BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(
          context,
          'register'
      );
    });
  }
  homeRoute (BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(
          context,
          'home'
      );
    });
  }

  // void login() async{
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //
  //   User user = User(
  //       correoElectronico: email,
  //       contrasena: password
  //   );
  //
  //   ResponseApi responseApi = await usersProvider.login(user);
  //
  //   if(responseApi.code == 200 && responseApi != ''){
  //     sharedPreferences?.setString("token", responseApi.data);
  //     Navigator.of(context!).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
  //     print('Respuesta EXITOSA: ${responseApi.toJson()}');
  //   }else{
  //     print('Respuesta FALLIDA: ${responseApi.toJson()}');
  //   }
  //
  // }

}
