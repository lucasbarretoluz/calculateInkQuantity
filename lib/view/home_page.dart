import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  // ..rotateX(_offset.dy * pi / 180)
                  //..rotateY(_offset.dx * pi / 180),
                  ..rotateX(rx)
                  ..rotateY(ry)
                  ..rotateZ(rz),
                alignment: Alignment.center,
                child: const Center(child: Cube())),
            const SizedBox(height: 30),
            Slider(
              value: rx,
              min: pi * -2,
              max: pi * 2,
              onChanged: ((value) => setState(() {
                    rx = -6.014827168191208;
                  })),
            ),
            Slider(
              value: ry,
              min: 0,
              max: pi + pi / 4,
              onChanged: ((value) => setState(() {
                    ry = value;
                  })),
            ),
            Slider(
              value: rz,
              min: pi * -2,
              max: pi * 2,
              onChanged: ((value) => setState(() {
                    rz = 6.283185307179586;
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
        ..rotateY(2 * pi),
      alignment: Alignment.center,
      child: Container(
        color: Colors.red,
        height: 200,
        width: 200,
        child: const Text(
          "lado A",
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
