// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculate_ink_quantity/model/wall_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculate_ink_quantity/main.dart';

void main() {
  test("LUCAS_VIADAO", () {
    expect(Wall(hight: 2, width: 12), 12);
  });
}
