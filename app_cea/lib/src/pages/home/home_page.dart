
import 'package:app_cea/src/pages/custom_app_bar/custom_app_bar.dart';
import 'package:app_cea/src/utils/custom_elements.dart';
import 'package:app_cea/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

List<String> locations = ['Boston (BOS)', 'New York (JFK)'];
const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 16.0);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeScreenTopPart(),
            homeScreenBottomPart
          ],
        ),
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  const HomeScreenTopPart({Key? key}) : super(key: key);

  @override
  State<HomeScreenTopPart> createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomElements(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                MyColors.primaryColor,
                MyColors.primaryColorDark
              ]

              ),
            ),
            child: Column( //Select de ciudades
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: const [
                      Icon(Icons.person, color: Colors.white,),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        "Estudiante",
                        style: dropDownLabelStyle,
                      ),
                      // PopupMenuButton(
                      //   onSelected: (int index) async => setState(() {
                      //       selectedLocationIndex = index;
                      //     }),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         locations[selectedLocationIndex],
                      //         style: dropDownLabelStyle
                      //       ),
                      //       const Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                      //     ],
                      //   ),
                      //   itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      //     PopupMenuItem(
                      //         value: 0,
                      //         child: Text(
                      //           locations[0],
                      //           style: dropDownMenuItemStyle,
                      //         ),
                      //     ),
                      //     PopupMenuItem(
                      //       value: 1,
                      //       child: Text(
                      //         locations[1],
                      //         style: dropDownMenuItemStyle,
                      //       ),
                      //     )
                      //   ]
                      // ),
                      Spacer(),
                      Icon(Icons.settings, color: Colors.white,)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                const Text('¡Hola Andrea!\nNos alegra mucho verte de nuevo',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

var  homeScreenBottomPart =  Column(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Mis Modulos', style: dropDownMenuItemStyle,),
          Spacer(),
          Text('Ver todos mis modulos',
            style: TextStyle(
                fontSize: 14.0,
                color: MyColors.primaryColor
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 210.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    ),
  ],
);

List<CityCard> cityCards = [
  const CityCard(imagePath: "assets/img/peximg.jpg", moduleName: "Proximas\nActividades"),
  const CityCard(imagePath: "assets/img/carlogimg.jpg", moduleName: "Mis Asistencias"),
  const CityCard(imagePath: "assets/img/peximg.jpg", moduleName: "Mi Horario"),
  const CityCard(imagePath: "assets/img/carlogimg.jpg", moduleName: "Mis Notas")
];
class CityCard extends StatelessWidget {
  final String imagePath, moduleName;
  const CityCard({Key? key, required this.imagePath, required this.moduleName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0)
            ),
            child: Stack(
              children: [
                Container(
                  height: 210.0,
                  width: 160.0,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 170.0,
                  height: 250.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                        Colors.black54, Colors.black12
                      ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Row(
                    children: [
                      Text(moduleName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18.0
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







