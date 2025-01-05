import '../enumerators/osm_type.dart';

class OsmId {
  final int value;
  final OsmType type;

  OsmId({required this.value, required this.type});

  factory OsmId.fromMap(Map<String, dynamic> map) {
    return OsmId(
      value: map["osm_id"],
      type: OsmType.fromString(map["osm_type"])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "osm_id": value,
      "osm_type": type.toString()
    };
  }
}