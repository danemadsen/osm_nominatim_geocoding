enum OsmType {
  node,
  way,
  relation;

  String get value {
    switch (this) {
      case OsmType.node:
        return 'N';
      case OsmType.way:
        return 'W';
      case OsmType.relation:
        return 'R';
    }
  }

  static OsmType fromString(String value) {
    switch (value) {
      case 'N':
      case 'node':
        return OsmType.node;
      case 'W':
      case 'way':
        return OsmType.way;
      case 'R':
      case 'relation':
        return OsmType.relation;
      default:
        throw ArgumentError('Invalid OsmType value');
    }
  }
}