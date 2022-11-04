import 'package:app_cea/src/pages/home/home_page.dart';
import 'package:app_cea/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_cea/src/pages/home/home_controller.dart';
import 'package:app_cea/src/pages/register/register_page.dart';

HomeController _homeController = new HomeController();

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=>_homeController.homeRoute(context),
      child: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _currentPage = index;
            });
          },
          currentIndex: _currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin, color: Colors.black,), label: 'Registros'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.black,), label: 'Notificaciones')
          ],
          type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

