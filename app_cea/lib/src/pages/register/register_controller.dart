import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_cea/src/provider/users_provider.dart';
import 'package:app_cea/src/models/response_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

import '../../models/user.dart';

class RegisterController{

  BuildContext? context;
  SharedPreferences? sharedPreferences;
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
  bool logStatus = false;

  Future? init(BuildContext context){
    this.context = context;
    usersProvider.init(context);
    checkToken(context);
  }

  loginPageRedi (BuildContext context){
    Navigator.pushNamed(
        context,
        'login'
    );
  }

  checkToken(context) async {
    SharedPreferences cache = await SharedPreferences.getInstance();
    dynamic token = cache.getString("token");

    if(token != '' && token != null){
      print('HAY TOKEN');
      logStatus = true;
    }else{
      print('NO HAY TOKEN');
      loginPageRedi(context);
    }
  }

  void register() async{
    String userId = userIdController.text.trim();
    String tipoDoc = tipoDocumentController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String address = addressController.text;
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String cellPhone = cellPhoneController.text.trim();
    String userType = userTypeController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirmation = passConfirmController.text.trim();

    switch(tipoDoc) {
      case "":
        {
          tipoDoc = '1';
        }
        break;
    }

    switch(userType) {
      case "":
        {
          userType = '1';
        }
        break;
      case "Pasaporte":
    }



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

    if (kDebugMode) {
      print('$user');
    }

    if(logStatus == true){
      ResponseApi responseApi = await usersProvider.register(user);
      print('Respuesta: ${responseApi.toJson()}');
    }

  }

}