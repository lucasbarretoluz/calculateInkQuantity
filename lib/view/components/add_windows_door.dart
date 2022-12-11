import 'package:flutter/material.dart';

class AddWindowsDoor extends StatefulWidget {
  const AddWindowsDoor({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWindowsDoor> createState() => _AddWindowsDoorState();
}

class _AddWindowsDoorState extends State<AddWindowsDoor> {
  int isSelected = 0;
  late double heightScreen, widthScreen;

  @override
  Widget build(BuildContext context) {
    heightScreen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    widthScreen = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = 1;
                });
              },
              child: Container(
                color: isSelected == 1 ? Colors.grey[400] : Colors.white,
                child: const ImageIcon(
                  AssetImage('assets/window.png'),
                  size: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = 0;
                });
              },
              child: Container(
                color: isSelected == 0 ? Colors.grey[400] : Colors.white,
                child: const ImageIcon(
                  AssetImage('assets/door.png'),
                  size: 60,
                ),
              ),
            )
          ],
        ),
        isSelected == 0
            ? _addDoorOrWindows(title: "Adicionar porta")
            : _addDoorOrWindows(title: "Adicionar janela"),
      ],
    );
  }

  Widget _addDoorOrWindows({required String title}) {
    return Container(
      height: heightScreen * 0.15,
      width: widthScreen * 0.5,
      color: Colors.amberAccent,
      child: Text(title),
    );
  }

}
