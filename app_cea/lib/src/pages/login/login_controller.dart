import 'package:app_cea/src/models/response_api.dart';
import 'package:app_cea/src/models/user.dart';
import 'package:app_cea/src/provider/users_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginController {

  BuildContext? context;

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

    print('Respuesta: ${responseApi.toJson()}');

    print('\nEmail: $email ---- Contraseña: $password');
    // if (kDebugMode) {
    // }
  }

}
