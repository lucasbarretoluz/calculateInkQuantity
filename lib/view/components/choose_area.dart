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
  late double heightScreen, widthScreen;
  double valueBottom = 1;
  @override
  Widget build(BuildContext context) {
    heightScreen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    widthScreen = MediaQuery.of(context).size.width;
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

            // SizedBox(width: widthScreen * 0.03),
            CustomText(text: "${valueBottom.toStringAsFixed(2)} m", size: 20),
            
             Column(
              children: [
                IconButton(
                    // iconSize: 25,
                    onPressed: () {
                      setState(() {
                        valueBottom += 0.01;
                        HomePage.of(context)?.widthValue = valueBottom += 0.01;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_up)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        valueBottom -= 0.01;
                        HomePage.of(context)?.widthValue = valueBottom -= 0.01;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down)),
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


// Column(
//               children: [
//                 IconButton(
//                     // iconSize: 25,
//                     onPressed: () {
//                       setState(() {
//                         valueBottom += 0.10;
//                         HomePage.of(context)?.widthValue = valueBottom += 0.10;
//                       });
//                     },
//                     icon: const Icon(Icons.arrow_drop_up)),
//                 IconButton(
//                     onPressed: () {
//                       setState(() {
//                         valueBottom -= 0.10;
//                         HomePage.of(context)?.widthValue = valueBottom -= 0.10;
//                       });
//                     },
//                     icon: const Icon(Icons.arrow_drop_down)),
//               ],
//             )