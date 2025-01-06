import 'package:geojson_vi/geojson_vi.dart';
import 'package:latlong2/latlong.dart';

import 'bounding_box.dart';
import 'osm_id.dart';

class Place {
    int placeId;
    String licence;
    OsmId osmId;
    LatLng position;
    String? category;
    String type;
    int placeRank;
    double importance;
    String addresstype;
    String name;
    String displayName;
    BBox boundingbox;
    GeoJSON? geojson;
    String? placeClass;
    Map<String, dynamic>? address;
    Map<String, dynamic>? extra;

    Place({
        required this.placeId,
        required this.licence,
        required this.osmId,
        required this.position,
        this.category,
        required this.type,
        required this.placeRank,
        required this.importance,
        required this.addresstype,
        required this.name,
        required this.displayName,
        required this.boundingbox,
        this.geojson,
        this.placeClass,
        this.address,
        this.extra,
    });

    factory Place.fromMap(Map<String, dynamic> map) {
        final extraKeys = map.keys.where((key) => ![
            "place_id",
            "licence",
            "osm_type",
            "osm_id",
            "lat",
            "lon",
            "category",
            "type",
            "place_rank",
            "importance",
            "addresstype",
            "name",
            "display_name",
            "boundingbox",
            "geojson",
            "class",
            "address",
        ].contains(key));

        final extras = Map<String, dynamic>.fromEntries(extraKeys.map((key) => MapEntry(key, map[key])));

        return Place(
            placeId: map["place_id"],
            licence: map["licence"],
            osmId: OsmId.fromMap(map),
            position: LatLng(double.parse(map["lat"].toString()), double.parse(map["lon"].toString())),
            category: map["category"],
            type: map["type"],
            placeRank: map["place_rank"],
            importance: map["importance"]?.toDouble(),
            addresstype: map["addresstype"],
            name: map["name"],
            displayName: map["display_name"],
            boundingbox: BBox.fromDynamicList(List<dynamic>.from(map["boundingbox"].map((x) => x))),
            geojson: map["geomap"] == null ? null : GeoJSON.fromMap(map["geojson"]),
            placeClass: map["class"],
            address: map["address"],
            extra: extras.isEmpty ? null : extras,
        );
    }

    Map<String, dynamic> toMap() => {
        "place_id": placeId,
        "licence": licence,
        ...osmId.toMap(),
        "lat": position.latitude,
        "lon": position.longitude,
        "category": category,
        "type": type,
        "place_rank": placeRank,
        "importance": importance,
        "addresstype": addresstype,
        "name": name,
        "display_name": displayName,
        "boundingbox": boundingbox.toList(),
        "geojson": geojson?.toMap(),
        "class": placeClass,
        "address": address,
        ...extra ?? {},
    };
}

extension Places on List<Place> {
    static List<Place> fromList(List<dynamic> list) {
        return list.map((e) => Place.fromMap(e)).toList();
    }

    List<Map<String, dynamic>> toMapList() {
        return map((e) => e.toMap()).toList();
    }
}