///
///
///
class Coordinate {
  late double x;
  late double y;
  late double z;

  ///
  ///
  ///
  Coordinate.fromJson(Map<String, dynamic> map) {
    x = map['X'];
    y = map['Y'];
    z = map['Z'];
  }
}
