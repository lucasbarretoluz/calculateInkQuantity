import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String text;
  late double size;
  int? sizeW;
  Color? color;

  CustomText(
      {Key? key,
      required this.text,
      required this.size,
      this.sizeW,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: (color ?? const Color.fromARGB(255, 21, 22, 23)),
      ),
    );
  }
}
