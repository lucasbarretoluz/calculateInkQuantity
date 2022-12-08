import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/cube.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

double rx = -6, ry = -pi / 4, rz = 2 * pi;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("RX: $rx, RY: $ry, RZ: $rz");
    return GestureDetector(
      onPanUpdate: (details) {
        ry += details.delta.dy * 0.1;
        setState(() {
          ry %= pi + pi / 4;
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
            Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  // ..rotateX(_offset.dy * pi / 180)
                  //..rotateY(_offset.dx * pi / 180),
                  ..rotateX(rx)
                  ..rotateY(ry)
                  ..rotateZ(rz),
                alignment: Alignment.center,
                child: Center(
                    child: Cube(
                  rx: rx,
                  ry: ry,
                ))),
            const SizedBox(height: 30),
            Slider(
              value: ry,
              min: -pi / 4,
              max: pi + pi / 4,
              onChanged: ((value) => setState(() {
                    ry = value;
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
