import 'package:geojson_vi/geojson_vi.dart';

class Details {
  int placeId;
  int parentPlaceId;
  String osmType;
  int osmId;
  String category;
  String type;
  dynamic adminLevel;
  String localname;
  Map<String,String> names;
  Map<String,dynamic> addresstags;
  String? housenumber;
  String? calculatedPostcode;
  String countryCode;
  DateTime indexedDate;
  double importance;
  double calculatedImportance;
  Map<String,dynamic> extratags;
  int rankAddress;
  int rankSearch;
  bool isarea;
  GeoJSON centroid;
  GeoJSON geometry;
  String? calculatedWikipedia;
  String? icon;
  List<Map<String,dynamic>>? linkedPlaces;

  Details({
    required this.placeId,
    required this.parentPlaceId,
    required this.osmType,
    required this.osmId,
    required this.category,
    required this.type,
    required this.adminLevel,
    required this.localname,
    required this.names,
    required this.addresstags,
    this.housenumber,
    this.calculatedPostcode,
    required this.countryCode,
    required this.indexedDate,
    required this.importance,
    required this.calculatedImportance,
    required this.extratags,
    required this.rankAddress,
    required this.rankSearch,
    required this.isarea,
    required this.centroid,
    required this.geometry,
    this.calculatedWikipedia,
    this.icon,
    this.linkedPlaces,
  });

  factory Details.fromMap(Map<String, dynamic> json) => Details(
    placeId: json["place_id"],
    parentPlaceId: json["parent_place_id"],
    osmType: json["osm_type"],
    osmId: json["osm_id"],
    category: json["category"],
    type: json["type"],
    adminLevel: json["admin_level"],
    localname: json["localname"],
    names: Map.from(json["names"]).map((k, v) => MapEntry<String, String>(k, v)),
    addresstags: json["addresstags"],
    housenumber: json["housenumber"],
    calculatedPostcode: json["calculated_postcode"],
    countryCode: json["country_code"],
    indexedDate: DateTime.parse(json["indexed_date"]),
    importance: json["importance"]?.toDouble(),
    calculatedImportance: json["calculated_importance"]?.toDouble(),
    extratags: json["extratags"],
    rankAddress: json["rank_address"],
    rankSearch: json["rank_search"],
    isarea: json["isarea"],
    centroid: GeoJSON.fromMap(json["centroid"]),
    geometry: GeoJSON.fromMap(json["geometry"]),
    calculatedWikipedia: json["calculated_wikipedia"],
    icon: json["icon"],
    linkedPlaces: json["linked_places"]
  );

  Map<String, dynamic> toMap() => {
    "place_id": placeId,
    "parent_place_id": parentPlaceId,
    "osm_type": osmType,
    "osm_id": osmId,
    "category": category,
    "type": type,
    "admin_level": adminLevel,
    "localname": localname,
    "names": Map.from(names).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "addresstags": addresstags,
    "housenumber": housenumber,
    "calculated_postcode": calculatedPostcode,
    "country_code": countryCode,
    "indexed_date": indexedDate.toIso8601String(),
    "importance": importance,
    "calculated_importance": calculatedImportance,
    "extratags": extratags,
    "rank_address": rankAddress,
    "rank_search": rankSearch,
    "isarea": isarea,
    "centroid": centroid.toMap(),
    "geometry": geometry.toMap(),
    "calculated_wikipedia": calculatedWikipedia,
    "icon": icon,
    "linked_places": linkedPlaces
  };
}