class Door {
  final double hight = 1.9;
  final double width = 0.8;
  late double doorArea = doorAreaCalc();

  double doorAreaCalc() {
    return hight * width;
  }
}

class Window {
  final double hight = 1.2;
  final double width = 2;
  late double windowArea = windowAreaCalc();

  double windowAreaCalc() {
    return hight * width;
  }
}
