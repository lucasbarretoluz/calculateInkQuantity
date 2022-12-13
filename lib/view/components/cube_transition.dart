import 'dart:math';

import 'package:flutter/material.dart';

import 'cube_3D.dart';

class CubeTrasition extends AnimatedWidget {
  final double width, height, depth;
  double rotateY;
  final double finalPosition;
  final Animation<double> animation;
  final String selected;
  CubeTrasition({
    Key? key,
    required this.width,
    required this.height,
    required this.depth,
    required this.rotateY,
    required this.animation,
    required this.selected,
    required this.finalPosition,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    var v = animation.value;
    var vpi = v * pi;
    print("vp  $v");
    print("vpi  $vpi");
    print("ry  $rotateY");
    print("final $finalPosition");
    return Column(children: [
      if (finalPosition > (rotateY + v * pi)) ...[
        Cube(
          width: width,
          height: height,
          depth: depth,
          rotateX: -6,
          rotateY: v * pi,
          sideSelected: selected,
        ),
      ] else ...[
        Cube(
          width: width,
          height: height,
          depth: depth,
          rotateX: -6,
          rotateY: finalPosition,
          sideSelected: selected,
        ),
      ]
    ]);
  }
}
