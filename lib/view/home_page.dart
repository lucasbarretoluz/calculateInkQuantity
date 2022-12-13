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

double rx = -6, ry = pi / 4, rz = 2 * pi;


class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _sideSelected = "A";
  late double heightScreen, widthScreen;
  double heightArea = 1, widthArea = 1;
  double sideArea = 0;
  double turns = 0.0;
//  late final AnimationController _controller = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1500),
//   )..forward();

  // @override
  // void dispose() {
  //   // _controller.dispose();
  //   super.dispose();
  // }
  void _onItemTapped(int index, String selected) {
    setState(() {
      _selectedIndex = index;
      _sideSelected = selected;
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
                      ry %= 2 * pi;
                    });
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration( seconds: 2),
                    child: Cube(
                      width: widthScreen * 0.35,
                      height: widthScreen * 0.35,
                      depth: widthScreen * 0.35,
                      rotateX: rx,
                      rotateY: ry,
                      sideSelected: _sideSelected,
                    ),
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
            ElevatedButton(onPressed: (){
                setState((() => turns += 1/4));
            }, child: Text("Rotate")),
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
    const double defaultView = -pi / 5;
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
            ry = defaultView;
            setState(() {
               turns += 1/4;
            });
            _onItemTapped(index, "A");
            break;
          case 1:
            ry = defaultView + pi / 2;
            _onItemTapped(index, "B");
            break;
          case 2:
            ry = defaultView + pi;
            _onItemTapped(index, "C");
            break;
          case 3:
            ry = defaultView + (3 * pi / 2);
            _onItemTapped(index, "D");
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
