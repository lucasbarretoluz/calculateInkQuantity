import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/cube_3d.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

double rx = 0.0, ry = 0.0, rz = 0.0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("RX: $rx, RY: $ry, RZ: $rz");
    return GestureDetector(
      onPanUpdate: (details) {
        rx += details.delta.dx * 0.01;
        ry += details.delta.dy * 0.01;
        setState(() {
          rx %= pi * 2;
          ry %= pi * 2;
        });
        // setState(() => _offset += details.delta);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Teste 2"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Cube3D(
              height: 200,
              width: 200,
              depth: 200,
              rotateX: rx,
              rotateY: ry,
            ),
            const SizedBox(height: 30),
            Slider(
              value: rx,
              min: pi * -2,
              max: pi * 2,
              onChanged: ((value) => setState(() {
                    rx = value;
                  })),
            ),
            Slider(
              value: ry,
              min: pi * -2,
              max: pi * 2,
              onChanged: ((value) => setState(() {
                    ry = value;
                  })),
            ),
            Slider(
              value: rz,
              min: pi * -2,
              max: pi * 2,
              onChanged: ((value) => setState(() {
                    rz = value;
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> childrens;
    late final sideA = Transform(
      //Front
      transform: Matrix4.identity()
        ..translate(0.0, 0.0, -100.0)
        ..rotateY(-pi),
      alignment: Alignment.center,
      child: Container(
        color: Colors.red,
        height: 200,
        width: 200,
      ),
    );

    late final sideB = Transform(
      //port
      transform: Matrix4.identity()
        ..translate(100.0, 0.0, 0.0)
        ..rotateY(pi / 2),
      alignment: Alignment.center,
      child: Container(
        color: Colors.green,
        height: 200,
        width: 200,
      ),
    );

    late final sideC = Transform(
      //back
      transform: Matrix4.identity()..translate(0.0, 0.0, 100.0),
      alignment: Alignment.center,
      child: Container(
        color: Colors.purple,
        height: 200,
        width: 200,
      ),
    );

    late final sideD = Transform(
      //port
      transform: Matrix4.identity()
        ..translate(-100.0, 0.0, 0.0)
        ..rotateY(-pi / 2),
      alignment: Alignment.center,
      child: Container(
        color: Colors.yellow,
        height: 200,
        width: 200,
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

    if (ry < -pi / 4) {
      childrens = [sideA, sideB];
    } else if (ry < -pi / 2) {
      childrens = [sideB, sideC, topSide];
    } else if (ry < 3 * pi / 4) {
      childrens = [sideC, sideD, topSide];
    } else {
      childrens = [sideD, sideA, topSide];
    }

    childrens.add(topSide);
    return Stack(children: childrens);
  }
}
