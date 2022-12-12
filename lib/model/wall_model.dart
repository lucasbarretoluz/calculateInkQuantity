class Wall {
  double hight = 1;
  double width = 1;
  int nDoor = 0;
  Door door = Door();
  int nWindow = 0;
  Window window = Window();
  late double totalArea;
  late double percentTotalAvailableArea;
  late double absoluteTotalAvailableArea;
  late bool doorAllowed;
  late bool windowAllowed;

  Wall({
    required this.hight,
    required this.width,
  }) {
    totalArea = hight * width;
    absoluteTotalAvailableArea =
        totalArea - nDoor * door.doorArea - nWindow * window.windowArea;
    percentTotalAvailableArea = (100 * absoluteTotalAvailableArea) / totalArea;
    doorAllowed = (percentTotalAvailableArea > 0.5 ? true : false) &&
        (hight > door.hight + 0.3 ? true : false) &
            (width > door.width ? true : false);
    windowAllowed = (percentTotalAvailableArea > 0.5 ? true : false) &&
        (hight > window.hight ? true : false) &
            (width > window.width ? true : false);
  }
}

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