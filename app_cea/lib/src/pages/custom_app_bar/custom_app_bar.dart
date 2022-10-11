import 'package:app_cea/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

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
          label: 'Perfil',
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
    return Material(
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

