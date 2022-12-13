import 'dart:math';

import 'package:flutter/material.dart';

import 'cube_3D.dart';

class CubeTrasition extends AnimatedWidget {
  final double width, height, depth;
  final double rotateY;
  final Animation<double> animation;
  final String selected;
  const CubeTrasition({
    Key? key,
    required this.width,
    required this.height,
    required this.depth,
    required this.rotateY,
    required this.animation,
    required this.selected,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    var v = animation.value;
    return Column(children: [
      if (v < 1) ...[
        Cube(
          width: width,
          height: height,
          depth: depth,
          rotateX: -6,
          rotateY: v * rotateY + pi,
          sideSelected: selected,
        ),
      ] else ...[
        Cube(
          width: width,
          height: height,
          depth: depth,
          rotateX: -6,
          rotateY: v * rotateY + pi,
          sideSelected: selected,
        ),
      ]
    ]);
  }
}
