import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_cea/src/provider/users_provider.dart';
import 'package:app_cea/src/models/response_api.dart';

import '../../models/user.dart';

class RegisterController{

  BuildContext? context;

  TextEditingController userIdController = new TextEditingController();
  TextEditingController tipoDocumentController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController cellPhoneController = new TextEditingController();
  TextEditingController userTypeController = new TextEditingController();
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
    String userId = userIdController.text.trim();
    String tipoDoc = tipoDocumentController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String address = addressController.text;
    String email = emailController.text.trim();
    int phone = phoneController.text as int;
    int cellPhone = cellPhoneController.text as int;
    String userType = userTypeController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirmation = passConfirmController.text.trim();

    User user = User(
        userId: userId,
        tipoDocumento: tipoDoc,
        nombres: name,
        apellidos: lastName,
        direccion: address,
        correoElectronico: email,
        telefono: phone,
        celular: cellPhone,
        tipoUsuario: userType,
        contrasena: password
    );

    ResponseApi responseApi = await usersProvider.register(user);

    print('Respuesta: ${responseApi.toJson()}');

    if (kDebugMode) {
      print('Email: $email ---- Nombre: $name ---- Apellido: $lastName ---- Telefono: $phone Contraseña: $password ---- Confirmacion Contraseña: $passwordConfirmation');
    }
  }
}