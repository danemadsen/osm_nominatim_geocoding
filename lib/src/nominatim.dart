import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim_geocoding/src/enumerators/osm_type.dart';

import 'classes/search_query.dart';
import 'enumerators/nominatim_routes.dart';
import 'classes/place.dart';

class Nominatim {
  final Dio _dioClient;

  Nominatim({Dio? dioClient}) : _dioClient = dioClient ?? Dio();

  Future<List<Place>?> search({String? q, SearchQuery? query}) async {
    assert((q == null) != (query == null), 'Either q or query must be provided, but not both');

    if (q != null) {
      return searchSimple(q);
    } 
    else {
      return searchStructured(query!);
    }
  }

  Future<List<Place>?> searchSimple(String q) async {
    final response = await _dioClient.get<List<dynamic>>(
      NominatimRoute.search.url,
      queryParameters: {
        'q': q,
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return Places.fromList(response.data!);
  }

  Future<List<Place>?> searchStructured(SearchQuery query) async {
    final response = await _dioClient.get<List<dynamic>>(
      NominatimRoute.search.url,
      queryParameters: query.toMap(),
    );

    if (response.data == null) return null;

    return Places.fromList(response.data!);
  }

  Future<Place?> reverse(LatLng position) async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.reverse.url,
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return Place.fromMap(response.data!);
  }

  Future<List<Place>?> lookup(Map<int, OsmType> osmIds) async {
    final entries = osmIds.entries;

    List<String> osmIdStrings = [];

    for (final entry in entries) {
      osmIdStrings.add('${entry.value.name[0]}${entry.key}');
    }

    final response = await _dioClient.get<List<dynamic>>(
      NominatimRoute.lookup.url,
      queryParameters: {
        'osm_ids': osmIdStrings.join(','),
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return Places.fromList(response.data!);
  }
}