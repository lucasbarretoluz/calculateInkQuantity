import 'wall_model.dart';

class Room {
  List<Wall> walls = List<Wall>.filled(4, Wall(hight: 1, width: 1));

  Room({
    required this.walls,
  });

  double get totalAreaToPaint =>
      walls[0].absoluteTotalAvailableArea +
      walls[1].absoluteTotalAvailableArea +
      walls[2].absoluteTotalAvailableArea +
      walls[3].absoluteTotalAvailableArea;

  double get inkAmount => totalAreaToPaint / 5;
}
