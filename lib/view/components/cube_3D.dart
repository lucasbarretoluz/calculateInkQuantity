import 'dart:math';
import 'package:flutter/material.dart';

class Cube extends StatelessWidget {
  final double width, height, depth;
  final double rotateX, rotateY;

  const Cube({
    super.key,
    required this.width,
    required this.height,
    required this.depth,
    this.rotateX = 0.0,
    rotateY = 0.0,
  }) : rotateY = rotateY % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final List<Widget> childrens;

    late final sideA = Transform(
      transform: Matrix4.translationValues(0.0, 0.0, depth / -2)
        ..rotateY(2 * pi),
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: const Center(child: Text("lado A")),
      ),
    );

    late final sideB = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate((width / 2), 0.0, 0.0)
          ..rotateY(-pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
        ),
      ),
    );

    late final sideC = Transform(
      transform: Matrix4.translationValues(0.0, 0.0, depth / 2)..rotateY(pi),
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.purple,
        ),
      ),
    );

    late final sideD = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate((width / -2), 0.0, 0.0)
          ..rotateY(pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ),
    );

    late final topSide = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(0.0, (height / -2), 0.0)
          ..rotateX(-pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
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
}
