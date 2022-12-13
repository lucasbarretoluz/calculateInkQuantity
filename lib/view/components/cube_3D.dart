import 'dart:math';
import 'package:calculate_ink_quantity/utils/customText.dart';
import 'package:flutter/material.dart';

class Cube extends StatelessWidget {
  final double width, height, depth;
  final double rotateX, rotateY;
  final String sideSelected;

  const Cube({
    super.key,
    required this.width,
    required this.height,
    required this.depth,
    this.rotateX = 0.0,
    rotateY = 0.0,
    required this.sideSelected,
  }) : rotateY = rotateY % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final List<Widget> childrens;

    late final sideA = Transform(
      transform: Matrix4.translationValues(0.0, 0.0, depth / -2)
        ..rotateY(2 * pi),
      alignment: Alignment.center,
      child: sideSelected == "A" ? isSelectedSide("A") : isNotSelectedSide(),
    );

    late final sideB = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate((width / 2), 0.0, 0.0)
          ..rotateY(-pi / 2),
        alignment: Alignment.center,
        child: sideSelected == "B" ? isSelectedSide("B") : isNotSelectedSide(),
      ),
    );

    late final sideC = Transform(
      transform: Matrix4.translationValues(0.0, 0.0, depth / 2)..rotateY(pi),
      alignment: Alignment.center,
      child: sideSelected == "C" ? isSelectedSide("C") : isNotSelectedSide(),
    );

    late final sideD = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate((width / -2), 0.0, 0.0)
          ..rotateY(pi / 2),
        alignment: Alignment.center,
        child: sideSelected == "D" ? isSelectedSide("D") : isNotSelectedSide(),
      ),
    );

    late final topSide = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(0.0, (height / -2), 0.0)
          ..rotateX(-pi / 2),
        alignment: Alignment.center,
        child: isNotSelectedSide(),
      ),
    );

    if (rotateY < pi / 4) {
      childrens = [sideB, sideA];
    } else if (rotateY < pi / 2) {
      childrens = [sideA, sideB];
    } else if (rotateY < 3 * pi / 4) {
      childrens = [sideC, sideB];
    } else if (rotateY < pi) {
      childrens = [sideB, sideC];
    } else if (rotateY < 5 * pi / 4) {
      childrens = [sideD, sideC];
    } else if (rotateY < 3 * pi / 2) {
      childrens = [sideC, sideD];
    } else {
      childrens = [sideD, sideA];
    }

    childrens.add(topSide);
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(rotateX)
          ..rotateY(rotateY),
        alignment: Alignment.center,
        child: Stack(children: childrens));
  }

  Widget isNotSelectedSide() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }

  Widget isSelectedSide(String title) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(text: title, size: 20),
              const SizedBox(width: 10)
            ],
          ),
        ],
      ),
    );
  }
}
