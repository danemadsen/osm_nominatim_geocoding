import 'package:geojson_vi/geojson_vi.dart';
import 'package:osm_nominatim_geocoding/osm_nominatim_geocoding.dart';

class Details {
  int placeId;
  int parentPlaceId;
  OsmId osmId;
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

  factory Details.fromMap(Map<String, dynamic> map) => Details(
    placeId: map["place_id"],
    parentPlaceId: map["parent_place_id"],
    osmId: OsmId.fromMap(map),
    category: map["category"],
    type: map["type"],
    adminLevel: map["admin_level"],
    localname: map["localname"],
    names: Map.from(map["names"]).map((k, v) => MapEntry<String, String>(k, v)),
    addresstags: map["addresstags"],
    housenumber: map["housenumber"],
    calculatedPostcode: map["calculated_postcode"],
    countryCode: map["country_code"],
    indexedDate: DateTime.parse(map["indexed_date"]),
    importance: map["importance"]?.toDouble(),
    calculatedImportance: map["calculated_importance"]?.toDouble(),
    extratags: map["extratags"],
    rankAddress: map["rank_address"],
    rankSearch: map["rank_search"],
    isarea: map["isarea"],
    centroid: GeoJSON.fromMap(map["centroid"]),
    geometry: GeoJSON.fromMap(map["geometry"]),
    calculatedWikipedia: map["calculated_wikipedia"],
    icon: map["icon"],
    linkedPlaces: map["linked_places"]
  );

  Map<String, dynamic> toMap() => {
    "place_id": placeId,
    "parent_place_id": parentPlaceId,
    ...osmId.toMap(),
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