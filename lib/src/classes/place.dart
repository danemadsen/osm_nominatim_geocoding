import 'dart:convert';

import 'package:geojson_vi/geojson_vi.dart';

import 'address.dart';

List<Place> placeFromJson(String str) => List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

String placetoMap(List<Place> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Place {
    int placeId;
    String licence;
    String osmType;
    dynamic osmId;
    String lat;
    String lon;
    String? category;
    String type;
    int? placeRank;
    double importance;
    String? addresstype;
    String? name;
    String displayName;
    List<String> boundingbox;
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

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        category: json["category"],
        type: json["type"],
        placeRank: json["place_rank"],
        importance: json["importance"]?.toDouble(),
        addresstype: json["addresstype"],
        name: json["name"],
        displayName: json["display_name"],
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
        geojson: json["geojson"] == null ? null : GeoJSON.fromMap(json["geojson"]),
        placeClass: json["class"],
        icon: json["icon"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        extratags: json["extratags"],
    );

    Map<String, dynamic> toMap() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
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
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
        "geojson": geojson?.toMap(),
        "class": placeClass,
        "icon": icon,
        "address": address?.toMap(),
        "extratags": extratags,
    };
}