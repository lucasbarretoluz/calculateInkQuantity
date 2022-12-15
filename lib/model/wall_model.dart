import 'room_model.dart';

class Wall {
  double hight = 1;
  double width = 1;
  int nDoor = 0;
  Door door = Door();
  int nWindow = 0;
  Window window = Window();

  Wall({
    required this.hight,
    required this.width,
  });

  double get totalArea => hight * width;
  double get absoluteTotalAvailableArea =>
      totalArea - nDoor * door.doorArea - nWindow * window.windowArea;
  double get percentTotalAvailableArea =>
      (absoluteTotalAvailableArea) / totalArea;

  double get absoluteTotalAvailableAreaPlusDoor =>
      totalArea - (nDoor + 1) * door.doorArea - nWindow * window.windowArea;
  double get percentTotalAvailableAreaPlusDoor =>
      (absoluteTotalAvailableAreaPlusDoor) / totalArea;

  double get absoluteTotalAvailableAreaPlusWindow =>
      totalArea - nDoor * door.doorArea - (nWindow + 1) * window.windowArea;
  double get percentTotalAvailableAreaPlusWindow =>
      (absoluteTotalAvailableAreaPlusWindow) / totalArea;

  bool get doorAllowed =>
      (percentTotalAvailableAreaPlusDoor > 0.5 ? true : false) &&
      (hight > door.hight + 0.3 ? true : false) &&
          ((width - door.width *( nDoor + 1)) > door.width ? true : false);
  bool get windowAllowed =>
      (percentTotalAvailableAreaPlusWindow > 0.5 ? true : false) &&
      (hight > window.hight ? true : false) &&
          ((width - window.width * (nWindow + 1)) > window.width ? true : false);
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
