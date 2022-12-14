import 'dart:math';
import 'package:calculate_ink_quantity/model/inks_model.dart';
import 'package:calculate_ink_quantity/model/wall_model.dart';
import 'package:calculate_ink_quantity/utils/customText.dart';
import 'package:calculate_ink_quantity/utils/themeColor.dart';
import 'package:flutter/material.dart';
import '../model/room_model.dart';
import 'components/add_windows_door.dart';
import 'components/choose_area.dart';
import '../utils/custom_card.dart';
import 'components/cube_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static _HomePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomePageState>();
}

double rx = -6, ry = 0, rz = 2 * pi, finalRy = 0;
Room room = Room(walls: [
  Wall(hight: 1, width: 1),
  Wall(hight: 1, width: 1),
  Wall(hight: 1, width: 1),
  Wall(hight: 1, width: 1)
]);

Inks ink = Inks(inkTotal: room.inkAmount);

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  String _sideSelected = "A";
  double _finalRy = 0;
  late double heightScreen, widthScreen;
  double turns = 0.0;

  late final AnimationController _controller = AnimationController(
    upperBound: 5,
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void repeatOnce() async {
    _controller.reset();
    await _controller.forward();
  }

  void _onItemTapped(int index, String selected, double finalry) {
    setState(() {
      _selectedIndex = index;
      _sideSelected = selected;
      _finalRy = finalry;
    });
  }

  set attWallH(double value) {
    room.walls[_selectedIndex].hight = value;
    setState(() {
      room;
      ink.inkTotal = room.inkAmount;
    });
  }

  set attWallW(double value) {
    room.walls[_selectedIndex].width = value;
    setState(() {
      room;
      ink.inkTotal = room.inkAmount;
    });
  }

  set attDoor(int value) {
    room.walls[_selectedIndex].nDoor = value;
    setState(() {
      room;
      ink.inkTotal = room.inkAmount;
    });
  }

  set attWindow(int value) {
    room.walls[_selectedIndex].nWindow = value;
    setState(() => room);
  }

  @override
  Widget build(BuildContext context) {
    heightScreen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        body: creatScreen(), bottomNavigationBar: bottomNavigationCube());
  }

  Widget creatScreen() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: heightScreen * 0.03),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  CustomText(
                      text:
                          "??rea total a ser pintada: ${room.totalAreaToPaint.toStringAsFixed(2)} m??",
                      size: 20,
                      color: ThemeColor.fontPrimary),
                  CustomText(
                      text:
                          "Ser??o necess??rios ${room.inkAmount.toStringAsFixed(2)} litros de tinta",
                      size: 20,
                      color: ThemeColor.fontPrimary),
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
                  child: CubeTrasition(
                    animation: _controller,
                    width: widthScreen * 0.35,
                    height: widthScreen * 0.35,
                    depth: widthScreen * 0.35,
                    rotateY: ry,
                    finalPosition: _finalRy,
                    selected: _sideSelected,
                  ),
                ),
                Column(
                  children: [
                    CustomText(
                        text: "Latas: ",
                        size: 20,
                        color: ThemeColor.fontPrimary),
                    CustomText(
                        text:
                            " ${ink.can18000}x 18L \n ${ink.can3600}x 3,6L \n ${ink.can2500}x 2,5L \n ${ink.can500}x 0,5L \n ",
                        size: 20,
                        color: ThemeColor.fontPrimary),
                  ],
                )
              ],
            ),
            SizedBox(height: heightScreen * 0.06),
            CustomCard(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text:
                            "??rea da parede: ${room.walls[_selectedIndex].totalArea.toStringAsPrecision(3)} m??",
                        size: 20)
                  ],
                ),
                ChooseArea(
                  slidString: "Altura",
                  wallValue: room.walls[_selectedIndex].hight,
                  area: room.walls[_selectedIndex].totalArea,
                  max: 50 / room.walls[_selectedIndex].width,
                ),
                ChooseArea(
                  slidString: "Largura",
                  wallValue: room.walls[_selectedIndex].width,
                  area: room.walls[_selectedIndex].totalArea,
                  max: 50 / room.walls[_selectedIndex].hight,
                ),
              ],
            )),
            SizedBox(height: heightScreen * 0.04),
            CustomCard(
                child: AddWindowsDoor(
              wall: room.walls[_selectedIndex],
            ))
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
      fixedColor: Colors.purple,
      unselectedItemColor: Colors.blue,
      onTap: (int index) {
        switch (index) {
          case 0:
            setState(() {
              finalRy = defaultView + 4 * pi;
              repeatOnce();
              _onItemTapped(index, "A", finalRy);
            });
            break;
          case 1:
            setState(() {
              finalRy = defaultView + pi / 2 + 2 * pi;
              repeatOnce();
              _onItemTapped(index, "B", finalRy);
            });

            break;
          case 2:
            setState(() {
              finalRy = defaultView + 2 * pi / 2 + 2 * pi;
              repeatOnce();
              _onItemTapped(index, "C", finalRy);
            });

            break;
          case 3:
            setState(() {
              finalRy = defaultView + (3 * pi / 2) + 2 * pi;
              repeatOnce();
              _onItemTapped(index, "D", finalRy);
            });

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
