import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cube extends StatelessWidget {
  double rx, ry;

  Cube({
    super.key,
    this.rx = 0.0,
    ry,
  }) : ry = ry % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final List<Widget> childrens;
    late final sideA = Transform(
      //Front
      transform: Matrix4.identity()
        ..translate(0.0, 0.0, -100.0)
        ..rotateY(2 * pi),
      alignment: Alignment.center,
      child: Container(
        color: Colors.red,
        height: 200,
        width: 200,
        child: const Text(
          "lado AA",
          textAlign: TextAlign.center,
        ),
      ),
    );

    late final sideB = Transform(
      //port
      transform: Matrix4.identity()
        ..translate(100.0, 0.0, 0.0)
        ..rotateY(-pi / 2),
      alignment: Alignment.center,
      child: Container(
        color: Colors.green,
        height: 200,
        width: 200,
        child: const Text(
          "lado B",
          textAlign: TextAlign.center,
        ),
      ),
    );

    late final sideC = Transform(
      //back
      transform: Matrix4.identity()
        ..translate(0.0, 0.0, 100.0)
        ..rotateY(pi),
      alignment: Alignment.center,
      child: Container(
        color: Colors.purple,
        height: 200,
        width: 200,
        child: const Text(
          "lado C",
          textAlign: TextAlign.center,
        ),
      ),
    );

    late final sideD = Transform(
      //port
      transform: Matrix4.identity()
        ..translate(-100.0, 0.0, 0.0)
        ..rotateY(pi / 2),
      alignment: Alignment.center,
      child: Container(
        color: Colors.yellow,
        height: 200,
        width: 200,
        child: const Text(
          "lado D",
          textAlign: TextAlign.center,
        ),
      ),
    );

    late final topSide = Transform(
      transform: Matrix4.identity()
        ..translate(0.0, -100.0, 0.0)
        ..rotateX(-pi / 2),
      alignment: Alignment.center,
      child: Container(
        color: Colors.black,
        height: 200,
        width: 200,
      ),
    );

    if (ry < pi / 4) {
      childrens = [sideB, sideA];
    } else if (ry < pi / 2) {
      childrens = [sideB, sideA, topSide];
    } else if (ry < 3 * pi / 4) {
      childrens = [sideC, sideB, topSide];
    } else if (ry < pi) {
      childrens = [sideB, sideC, topSide];
    } else if (ry < 5 * pi / 4) {
      childrens = [sideD, sideC, topSide];
    } else if (ry < 3 * pi / 2) {
      childrens = [sideC, sideD, topSide];
    } else {
      childrens = [sideD, sideA, topSide];
    }

    childrens.add(topSide);
    return Stack(children: childrens);
  }
}
