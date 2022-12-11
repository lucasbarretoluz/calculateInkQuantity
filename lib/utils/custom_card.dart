import 'package:flutter/material.dart';

import 'themeColor.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.object,
  }) : super(key: key);

  final Widget object;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.backgroundCard,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Color(0xffe8e8f0), spreadRadius: 1.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: object,
      ),
    );
  }
}