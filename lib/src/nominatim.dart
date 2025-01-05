import 'package:dio/dio.dart';

import 'classes/structured_search_query.dart';
import 'enumerators/nominatim_routes.dart';
import 'classes/place.dart';

class Nominatim {
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
    final response = await _dioClient.get<List<dynamic>>(
      NominatimRoute.search.url,
      queryParameters: {
        'q': q,
        'format': 'json'
      },
    );

    if (response.data == null) {
      return [];
    }

    return Places.fromList(response.data!);
  }

  Future<List<Place>> searchStructured(SearchQuery query) async {
    final response = await _dioClient.get<List<dynamic>>(
      NominatimRoute.search.url,
      queryParameters: query.toMap(),
    );

    if (response.data == null) {
      return [];
    }

    return Places.fromList(response.data!);
  }
}