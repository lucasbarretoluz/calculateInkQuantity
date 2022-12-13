import 'package:calculate_ink_quantity/utils/customText.dart';
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
            const SizedBox(height: 5),
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
            ),
            const SizedBox(height: 5),
          ],
        ),
        isSelected == 0
            ? _addDoorOrWindows(title: "Adicionar porta")
            : _addDoorOrWindows(title: "Adicionar janela"),
      ],
    );
  }

  Widget _addDoorOrWindows({required String title}) {
    return SizedBox(
      height: heightScreen * 0.15,
      width: widthScreen * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: title, size: 20),
          SizedBox(height: heightScreen * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    print("turubom 2");
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  )),
              Container(
                width: 60,
                height: 60,
                child: Center(child: CustomText(text: "22", size: 25)),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
              ),
              IconButton(
                  onPressed: () {
                    print("turubom");
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
