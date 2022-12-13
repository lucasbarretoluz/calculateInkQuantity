import 'package:flutter/material.dart';
import 'dart:math';
import '../../utils/customText.dart';
import '../home_page.dart';

class ChooseArea extends StatefulWidget {
  ChooseArea({
    Key? key,
    required this.slidString,
  }) : super(key: key);

  final String slidString;

  @override
  State<ChooseArea> createState() => _ChooseAreaState();
}

class _ChooseAreaState extends State<ChooseArea> {
  double valueBottom = 1;

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
                  value: valueBottom,
                  label: "${valueBottom.toStringAsFixed(2)} m",
                  divisions: 100,
                  min: 1,
                  max: 50,
                  onChanged: (value) {
                    if (widget.slidString == "Altura") {
                      HomePage.of(context)?.widthValue = roundDouble(value, 2);
                    } else {
                      HomePage.of(context)?.heightValue = roundDouble(value, 2);
                    }
                    setState(() => valueBottom = value);
                  }),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (valueBottom < 50.0) {
                          if (widget.slidString == "Altura") {
                            HomePage.of(context)?.widthValue =
                                valueBottom += 0.01;
                          } else {
                            HomePage.of(context)?.heightValue =
                                valueBottom += 0.01;
                          }
                        }
                      });
                    },
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_drop_up,
                    )),
                CustomText(
                    text: "${valueBottom.toStringAsFixed(2)} m", size: 20),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (valueBottom > 1.0) {
                          if (widget.slidString == "Altura") {
                            HomePage.of(context)?.widthValue =
                                valueBottom -= 0.01;
                          } else {
                            HomePage.of(context)?.heightValue =
                                valueBottom -= 0.01;
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
