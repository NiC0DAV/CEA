import 'package:app_cea/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_cea/src/pages/home/home_controller.dart';

HomeController _homeController = new HomeController();

class CustomAppBar extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomBarItems = [];

   CustomAppBar(){
    bottomBarItems.add(
        const BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.black,),
        label: 'Inicio',
      ),
    );
    bottomBarItems.add(
      const BottomNavigationBarItem(
          icon: Icon(Icons.person_pin, color: Colors.black,),
          label: 'Registros',
      ),
    );

    bottomBarItems.add(
      const BottomNavigationBarItem(
        icon: Icon(Icons.question_mark, color: Colors.black,),
        label: 'PQRS',
      ),
    );
    bottomBarItems.add(
      const BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.black,),
          label: 'Notificaciones',

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _homeController.registerRoute,
      child: Material(
        child: BottomNavigationBar(
          items: bottomBarItems,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

