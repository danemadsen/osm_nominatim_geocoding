import 'package:geojson_vi/geojson_vi.dart';

import 'bounding_box.dart';
import 'osm_type.dart';
import 'address.dart';

class Place {
    int placeId;
    String licence;
    OsmType osmType;
    String osmId;
    String lat;
    String lon;
    String? category;
    String type;
    int? placeRank;
    double importance;
    String? addresstype;
    String? name;
    String displayName;
    BBox boundingbox;
    GeoJSON? geojson;
    String? placeClass;
    String? icon;
    Address? address;
    Map<String, dynamic>? extratags;

    Place({
        required this.placeId,
        required this.licence,
        required this.osmType,
        required this.osmId,
        required this.lat,
        required this.lon,
        this.category,
        required this.type,
        this.placeRank,
        required this.importance,
        this.addresstype,
        this.name,
        required this.displayName,
        required this.boundingbox,
        this.geojson,
        this.placeClass,
        this.icon,
        this.address,
        this.extratags,
    });

    factory Place.fromMap(Map<String, dynamic> map) => Place(
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
        icon: map["icon"],
        address: map["address"] == null ? null : Address.fromMap(map["address"]),
        extratags: map["extratags"],
    );

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
        "icon": icon,
        "address": address?.toMap(),
        "extratags": extratags,
    };
}