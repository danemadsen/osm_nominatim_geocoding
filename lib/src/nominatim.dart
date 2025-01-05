import 'package:dio/dio.dart';
import 'package:osm_nominatim_geocoding/src/classes/structured_search_query.dart';

import 'classes/place.dart';

class Nominatim {
  static const String _baseUrl = 'https://nominatim.openstreetmap.org';
  final Dio _dioClient;

  Nominatim({Dio? dioClient}) : _dioClient = dioClient ?? Dio();

  Future<List<Place>> search({String? q, SearchQuery? query}) async {
    assert((q == null) != (query == null), 'Either q or query must be provided, but not both');

    if (q != null) {
      return searchSimple(q);
    } 
    else {
      return searchStructured(query!);
    }
  }

  Future<List<Place>> searchSimple(String q) async {
    final response = await _dioClient.get<List<Map<String,dynamic>>>(
      '$_baseUrl/search',
      queryParameters: {
        'q': q,
        'format': 'json'
      },
    );

    if (response.data == null) {
      return [];
    }

    return Places.fromMapList(response.data!);
  }

  Future<List<Place>> searchStructured(SearchQuery query) async {
    final response = await _dioClient.get<List<Map<String,dynamic>>>(
      '$_baseUrl/search',
      queryParameters: query.toMap(),
    );

    if (response.data == null) {
      return [];
    }

    return Places.fromMapList(response.data!);
  }
}