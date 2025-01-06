import 'dart:convert';

import 'package:geojson_vi/geojson_vi.dart';
import 'package:osm_nominatim_geocoding/osm_nominatim_geocoding.dart';

void main() async {
  List<GeoJSONFeatureCollection> places = [];
  List<SearchQuery> queries = [
    SearchQuery(
      street: 'Mott St',
      city: 'Brisbane'
    ),
    SearchQuery(
      amenity: 'restaurant',
      city: 'Dresden'
    ),
    SearchQuery(
      city: 'Berlin',
      country: 'Germany'
    ),
    SearchQuery(
      state: 'California',
      country: 'USA'
    ),
    SearchQuery(
      city: 'Wuhan',
      country: 'China'
    ),
    SearchQuery(
      street: 'Lombard St',
      city: 'San Francisco',
    ),
    SearchQuery(
      amenity: 'theatre',
      city: 'London'
    )
  ];

  Nominatim nominatim = Nominatim();

  for (SearchQuery query in queries) {
    GeoJSONFeatureCollection? result = await nominatim.search(query: query);
    if (result != null) {
      places.add(result);
    }
  }

  final mapList = places.map((e) => e.toMap()).toList();
  final json = jsonEncode(mapList);
  print(json);
}
