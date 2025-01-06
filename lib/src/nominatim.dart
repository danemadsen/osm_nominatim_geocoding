import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim_geocoding/src/classes/details.dart';

import 'enumerators/nominatim_routes.dart';
import 'classes/osm_id.dart';
import 'classes/search_query.dart';
import 'classes/status.dart';
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

  Future<List<Place>?> lookup(List<OsmId> osmIds) async {
    List<String> osmIdStrings = [];

    for (final id in osmIds) {
      osmIdStrings.add('${id.type.name[0]}${id.value}');
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

  Future<Details?> details(int placeId) async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.details.url,
      queryParameters: {
        'place_id': placeId,
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return Details.fromMap(response.data!);
  }

  Future<Status?> status() async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.status.url,
      queryParameters: {
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return Status.fromMap(response.data!);
  }
}