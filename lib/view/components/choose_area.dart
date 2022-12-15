import 'package:calculate_ink_quantity/model/wall_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../model/room_model.dart';
import '../../utils/customText.dart';
import '../home_page.dart';

class ChooseArea extends StatefulWidget {
  ChooseArea({
    Key? key,
    required this.slidString,
    required this.wallValue,
    required this.area,
  }) : super(key: key);

  final String slidString;
  double wallValue;
  double area;

  @override
  State<ChooseArea> createState() => _ChooseAreaState();
}

class _ChooseAreaState extends State<ChooseArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: CustomText(text: widget.slidString, size: 18),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                  value: widget.wallValue,
                  label: "${widget.wallValue.toStringAsFixed(2)} m",
                  divisions: 100,
                  min: 1,
                  max: (50 / (widget.area / widget.wallValue)) + 5,
                  onChanged: (value) {
                    if (widget.slidString == "Altura") {
                      HomePage.of(context)?.attWallH = roundDouble(value, 2);
                    } else {
                      HomePage.of(context)?.attWallW = roundDouble(value, 2);
                    }
                    setState(() {
                      if (widget.slidString == "Altura") {
                        HomePage.of(context)?.attWallH = roundDouble(value, 2);
                      } else {
                        HomePage.of(context)?.attWallW = roundDouble(value, 2);
                      }
                    });
                  }),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.wallValue < 50.0) {
                          if (widget.slidString == "Altura") {
                            HomePage.of(context)?.attWallH =
                                widget.wallValue += 0.01;
                          } else {
                            HomePage.of(context)?.attWallW =
                                widget.wallValue += 0.01;
                          }
                        }
                      });
                    },
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_drop_up,
                    )),
                CustomText(
                    text: "${widget.wallValue.toStringAsFixed(2)} m", size: 20),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.wallValue > 1.0) {
                          if (widget.slidString == "Altura") {
                            HomePage.of(context)?.attWallH =
                                widget.wallValue -= 0.01;
                          } else {
                            HomePage.of(context)?.attWallH =
                                widget.wallValue -= 0.01;
                          }
                        }
                      });
                    },
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_drop_down))
              ],
            )
          ],
        ),
      ],
    );
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
