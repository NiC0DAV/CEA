import 'package:app_cea/src/pages/register/register_controller.dart';
import 'package:app_cea/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

RegisterController _registerController = new RegisterController();
List<String> docType = [
  'Cedula de Ciudadania',
  'Pasaporte',
  'PEP',
  'Cedula de Extranjeria'
];

List<String> userType = [
  'Administrador',
  'Estudiante',
  'Recepcionista',
  'Instructor'
];
String? value ;
String? value1;
String? _selectedItem3;
String? _selectedItem4;
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _registerController.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(top: -80, left: -100, child: _circleLoginSvg()),
          Positioned(top: 65, left: 27, child: _registerText()),
          Positioned(top: 51, left: -5, child: _iconButton()),
          Container(
            margin: EdgeInsets.only(top: 150),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _userProfileImage(),
                  const SizedBox(height: 30),
                  _userIdField(),
                  _docTypeList(),
                  _nameTextField(),
                  _lastNameTextField(),
                  _addressTextField(),
                  _phoneTextField(),
                  _cellPhoneTextField(),
                  _userTypeList(),
                  _emailTextField(),
                  _passwordTextField(),
                  _passwordConfirmationTextField(),
                  _registerButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _userProfileImage() {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey200,
    );
  }

  Widget _circleLoginSvg() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }

  Widget _iconButton() {
    return IconButton(
        onPressed: () => _registerController.loginPageRedi(context),
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white));
  }

  Widget _registerText() {
    return const Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'NimbusSans'),
    );
  }

Widget _docTypeList(){
  List<DropdownMenuItem<String>> _createList() {
    return docType.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(value: e, child: Text(e),),).toList();
  }
  return Container(
    width: 315,
    height: 55,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30),
    ),
    child: DropdownButtonFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.credit_card, color: Color(0xFFE91E63)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(231, 13, 50, 0.09))
        ),
        hintText: "Tipo de Documento",
        hintStyle: TextStyle(color: Color(0xFFFF7782)),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(10),
      ),
      items: _createList(),
      isExpanded: true,
      value: _selectedItem3,
      onChanged: (String? value) => setState(() {
        _selectedItem3 = value ?? "";
      }),
    ),
  );
}

  Widget _userTypeList(){
    List<DropdownMenuItem<String>> _createList2() {
      return userType.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(value: e, child: Text(e),),).toList();
    }
    return Container(
      width: 315,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.verified_user_rounded, color: Color(0xFFE91E63)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(231, 13, 50, 0.09))
          ),
          hintText: "Tipo de Usuario",
          hintStyle: TextStyle(color: Color(0xFFFF7782)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
        items: _createList2(),
        isExpanded: true,
        value: _selectedItem4,
        onChanged: (String? value) => setState(() {
          _selectedItem4 = value ?? "";
        }),
      ),
    );
  }

  Widget _userIdField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _registerController.userIdController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Numero de Identificacion',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.perm_identity, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _addressTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.emailController,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          hintText: 'Direccion de Residencia',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.email, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.email, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _lastNameTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.lastNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _phoneTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Telefono',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.phone, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _cellPhoneTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Celular',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.settings_cell, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _passwordConfirmationTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _registerController.passConfirmController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Confirmar Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock_outline, color: MyColors.primaryColor),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: _registerController.register,
        child: Text('REGISTRARME'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }
}
