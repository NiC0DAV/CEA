import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_cea/src/provider/users_provider.dart';
import 'package:app_cea/src/models/response_api.dart';

import '../../models/user.dart';

class RegisterController{

  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passConfirmController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context){
    this.context = context;
    usersProvider.init(context);
  }

  loginPageRedi (BuildContext context){
    Navigator.pushNamed(
        context,
        'login'
    );
  }

  void register() async{
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirmation = passConfirmController.text.trim();

    User user = User(
        correoElectronico: email,
        nombres: name,
        apellidos: lastName,
        // celular: phone,
        contrasena: password
    );

    ResponseApi responseApi = await usersProvider.register(user);

    print('Respuesta: ${responseApi.toJson()}');

    if (kDebugMode) {
      print('Email: $email ---- Nombre: $name ---- Apellido: $lastName ---- Telefono: $phone Contraseña: $password ---- Confirmacion Contraseña: $passwordConfirmation');
    }
  }
}