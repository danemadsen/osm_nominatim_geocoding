class BBox {
  final double x;
  final double y;
  final double z;
  final double m;

  BBox({
    required this.x,
    required this.y,
    required this.z,
    required this.m,
  });

  factory BBox.fromDoubleList(List<double> list) => BBox(
    x: list[0],
    y: list[1],
    z: list[2],
    m: list[3],
  );
  
  factory BBox.fromDynamicList(List<dynamic> list) => BBox(
    x: list[0].toDouble(),
    y: list[1].toDouble(),
    z: list[2].toDouble(),
    m: list[3].toDouble(),
  );

  List<double> toList() => [x, y, z, m];

  double operator [](int index) {
    switch (index) {
      case 0:
        return x;
      case 1:
        return y;
      case 2:
        return z;
      case 3:
        return m;
      default:
        throw RangeError.index(index, this, 'index', null, 4);
    }
  }
}