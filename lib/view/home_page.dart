import 'dart:math';
import 'package:calculate_ink_quantity/utils/customText.dart';
import 'package:flutter/material.dart';
import 'components/add_windows_door.dart';
import 'components/choose_area.dart';
import 'components/cube_3D.dart';
import '../utils/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();

  static _HomePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomePageState>();
}

double rx = -6, ry = -pi / 4, rz = 2 * pi;

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late double heightScreen, widthScreen;
  double heightArea = 1, widthArea = 1;
  double sideArea = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  set heightValue(double value) {
    heightArea = value;
    sideArea = heightArea * widthArea;
    setState(() => sideArea);
  }

  set widthValue(double value) {
    widthArea = value;
    sideArea = heightArea * widthArea;
    setState(() => sideArea);
  }

  @override
  Widget build(BuildContext context) {
    heightScreen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Teste 2"),
        // ),
        body: creatScreen(),
        bottomNavigationBar: bottomNavigationCube());
  }

  Widget creatScreen() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: heightArea * 1),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  CustomText(
                      text: "Área total: 120 m²",
                      size: 20,
                      color: Colors.black),
                  CustomText(
                      text: "Serão necessários 24 litros de tinta",
                      size: 20,
                      color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: heightScreen * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onPanUpdate: (details) {
                    ry += details.delta.dx * 0.01;
                    setState(() {
                      ry %= pi + pi / 4;
                    });
                  },
                  child: Cube(
                    width: widthScreen * 0.35,
                    height: widthScreen * 0.35,
                    depth: widthScreen * 0.35,
                    rotateX: rx,
                    rotateY: ry,
                  ),
                ),
                Column(
                  children: [
                    CustomText(text: "Latas: ", size: 20, color: Colors.black),
                    CustomText(text: " 1x 18L", size: 20, color: Colors.black),
                  ],
                )
              ],
            ),
            SizedBox(height: heightScreen * 0.06),
            Visibility(
              visible: false,
              child: Slider(
                value: ry,
                min: -pi / 4,
                max: pi + pi / 4,
                onChanged: ((value) => setState(() {
                      ry = value;
                    })),
              ),
            ),
            CustomCard(
                object: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Área do quadrado: ${sideArea.toStringAsFixed(2)} m²",
                        style: const TextStyle(fontSize: 17))
                  ],
                ),
                ChooseArea(slidString: "Altura"),
                ChooseArea(slidString: "Largura"),
              ],
            )),
            SizedBox(height: heightScreen * 0.01),
            const CustomCard(object: AddWindowsDoor())
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationCube() {
    return BottomNavigationBar(
      items: [
        _buildItem("A"),
        _buildItem("B"),
        _buildItem("C"),
        _buildItem("D"),
      ],
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      fixedColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        switch (index) {
          case 0:
            ry = -0.39276582928047543;
            _onItemTapped(index);
            break;
          case 1:
            ry = 1.1879139939832022;
            _onItemTapped(index);
            break;
          case 2:
            ry = 2.6989639535562695;
            _onItemTapped(index);
            break;
          case 3:
            ry = 3.9269908169872414;
            _onItemTapped(index);
            break;
          default:
        }
      },
    );
  }

  BottomNavigationBarItem _buildItem(String textLabel) {
    return BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage('assets/parede-de-tijolos.png'),
        size: 36,
      ),
      label: textLabel,
    );
  }
}

// import 'dart:math';
// import 'package:calculate_ink_quantity/utils/customText.dart';
// import 'package:flutter/material.dart';
// import 'components/add_windows_door.dart';
// import 'components/choose_area.dart';
// import 'components/cube_3D.dart';
// import '../utils/custom_card.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<HomePage> createState() => _HomePageState();

//   static _HomePageState? of(BuildContext context) =>
//       context.findAncestorStateOfType<_HomePageState>();
// }

// class _HomePageState extends State<HomePage> {
//   late double heightScreen, widthScreen;

//   double? heightArea, widthArea;

//   set heightValue(double value) {
//     heightArea = value;
//     print("heightArea = $heightArea");
//   }

//   set widthValue(double value) {
//     widthArea = value;
//     print("widthArea = $widthArea");
//   }

//   @override
//   Widget build(BuildContext context) {
//     heightScreen =
//         MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
//     widthScreen = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Test "),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           ChooseArea(slidString: "Height"),
//           ChooseArea(slidString: "Width"),
//         ],
//       ),
//     );
//   }
// }
