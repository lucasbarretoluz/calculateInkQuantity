import 'dart:math';

import 'package:flutter/material.dart';

class Cube3D extends StatelessWidget {
  final double width, height, depth;
  final double rotateX, rotateY;

  const Cube3D({
    super.key,
    required this.width,
    required this.height,
    required this.depth,
    this.rotateX = 0.0,
    rotateY = 0.0,
  }) : rotateY = rotateY % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children;

    late final front = Transform(
      transform: Matrix4.translationValues(0.0, 0.0, depth / -2),
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Color(0xff2c867b),
        ),
        child: const Center(child: Text("teste")),
      ),
    );

    late final back = Transform(
      transform: Matrix4.translationValues(0.0, 0.0, depth / 2),
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Color(0xff0c665b),
        ),
      ),
    );

    late final top = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(0.0, (height / -2), 0.0)
          ..rotateX(pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xff0b4040),
          ),
        ),
      ),
    );

    late final starboard = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate((width / 2), 0.0, 0.0)
          ..rotateY(pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xff0c665b),
          ),
        ),
      ),
    );

    late final bottom = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(0.0, (height / 2), 0.0)
          ..rotateX(pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xff0b4040),
          ),
        ),
      ),
    );

    late final port = Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate((width / -2), 0.0, 0.0)
          ..rotateY(pi / 2),
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xff0c665b),
          ),
        ),
      ),
    );
    if (rotateY < pi / 4) {
      children = [starboard, front];
    } else if (rotateY < pi / 2) {
      children = [front, starboard];
    } else if (rotateY < 3 * pi / 4) {
      children = [back, starboard];
    } else if (rotateY < pi) {
      children = [starboard, back];
    } else if (rotateY < 5 * pi / 4) {
      children = [port, back];
    } else if (rotateY < 3 * pi / 2) {
      children = [back, port];
    } else if (rotateY < 7 * pi / 4) {
      children = [front, port];
    } else {
      children = [port, front];
    }
    if (rotateX > 0.0) {
      children.add(top);
    } else {
      children.add(bottom);
    }

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotateX)
        ..rotateY(rotateY),
      alignment: Alignment.center,
      child: Stack(children: children),
    );
  }
}
