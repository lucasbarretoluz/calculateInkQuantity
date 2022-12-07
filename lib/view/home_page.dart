import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rx = 0.0, ry = 0.0, rz = 0.0;
  @override
  Widget build(BuildContext context) {
   print("RX: $rx, RY: $ry");
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
                  // ..rotateY(_offset.dx * pi / 180),
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
    return Stack(
      children: [
        Transform(
          //Front
          transform: Matrix4.identity()..translate(0.0, 0.0, -100.0),
          alignment: Alignment.center,
          child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
        ),
        Transform(
          //port
          transform: Matrix4.identity()
            ..translate(100.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.green,
            height: 200,
            width: 200,
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 100.0, 0.0)
            ..rotateX(pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.blue,
            height: 200,
            width: 200,
          ),
        ),
        Transform(
          //back
          transform: Matrix4.identity()..translate(0.0, 0.0, 100.0),
          alignment: Alignment.center,
          child: Container(
            color: Colors.purple,
            height: 200,
            width: 200,
          ),
        ),
        Transform(
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
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -100.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.amber,
            height: 200,
            width: 200,
          ),
        ),
      ],
    );
  }
}
