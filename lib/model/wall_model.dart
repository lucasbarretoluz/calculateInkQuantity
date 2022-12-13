import 'room_model.dart';

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
  late double percentTotalAvailableAreaPlusDoor;
  late double absoluteTotalAvailableAreaPlusDoor;
  late double percentTotalAvailableAreaPlusWindow;
  late double absoluteTotalAvailableAreaPlusWindow;
  late bool doorAllowed;
  late bool windowAllowed;

  Wall({
    required this.hight,
    required this.width,
  }) {
    totalArea = hight * width;
    absoluteTotalAvailableArea =
        totalArea - nDoor * door.doorArea - nWindow * window.windowArea;
    percentTotalAvailableArea = (absoluteTotalAvailableArea) / totalArea;

    absoluteTotalAvailableAreaPlusDoor =
        totalArea - (nDoor + 1) * door.doorArea - nWindow * window.windowArea;
    percentTotalAvailableAreaPlusDoor =
        (absoluteTotalAvailableAreaPlusDoor) / totalArea;

    absoluteTotalAvailableAreaPlusWindow =
        totalArea - nDoor * door.doorArea - (nWindow + 1) * window.windowArea;
    percentTotalAvailableAreaPlusWindow =
        (absoluteTotalAvailableAreaPlusWindow) / totalArea;

    doorAllowed = (percentTotalAvailableAreaPlusDoor > 0.5 ? true : false) &&
        (hight > door.hight + 0.3 ? true : false) &
            (width > door.width ? true : false);
    windowAllowed =
        (percentTotalAvailableAreaPlusWindow > 0.5 ? true : false) &&
            (hight > window.hight ? true : false) &
                (width > window.width ? true : false);
  }
}
