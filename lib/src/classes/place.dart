import 'package:geojson_vi/geojson_vi.dart';

import 'bounding_box.dart';
import 'osm_type.dart';
import 'address.dart';

class Place {
    int placeId;
    String licence;
    OsmType osmType;
    int osmId;
    String lat;
    String lon;
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
    Address? address;
    Map<String, dynamic>? extra;

    Place({
        required this.placeId,
        required this.licence,
        required this.osmType,
        required this.osmId,
        required this.lat,
        required this.lon,
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
        // Only the unused fields 
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
            osmType: OsmType.fromString(map["osm_type"]),
            osmId: map["osm_id"],
            lat: map["lat"],
            lon: map["lon"],
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
            address: map["address"] == null ? null : Address.fromMap(map["address"]),
            extra: extras.isEmpty ? null : extras,
        );
    }

    Map<String, dynamic> toMap() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType.name,
        "osm_id": osmId,
        "lat": lat,
        "lon": lon,
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
        "address": address?.toMap(),
        ...extra ?? {},
    };
}