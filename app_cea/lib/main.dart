import 'package:app_cea/src/pages/home/home_page.dart';
import 'package:app_cea/src/pages/login/login_page.dart';
import 'package:app_cea/src/pages/register/register_page.dart';
import 'package:app_cea/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  SharedPreferences? sharedPreferences;
  void initState(){
    super.initState();
    checkLoginStatus();
  }
  
  checkLoginStatus()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences?.getString("token") == null || sharedPreferences?.getString("token") == ''){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()), (Route<dynamic> route) => false);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SGC-CEA',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
        'home' : (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: MyColors.primaryColor),
          primaryColor: MyColors.primaryColor,
          fontFamily: 'Poppins',
      ),
    );
  }
}