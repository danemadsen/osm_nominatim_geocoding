import 'package:dio/dio.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim_geocoding/src/classes/details.dart';

import 'enumerators/nominatim_routes.dart';
import 'classes/osm_id.dart';
import 'classes/search_query.dart';
import 'classes/status.dart';

class Nominatim {
  final Dio _dioClient;

  Nominatim({Dio? dioClient}) : _dioClient = dioClient ?? Dio();

  Future<GeoJSONFeatureCollection?> search({String? q, SearchQuery? query}) async {
    assert((q == null) != (query == null), 'Either q or query must be provided, but not both');

    if (q != null) {
      return searchSimple(q);
    } 
    else {
      return searchStructured(query!);
    }
  }

  Future<GeoJSONFeatureCollection?> searchSimple(String q) async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.search.url,
      queryParameters: {
        'q': q,
        'format': 'geojson'
      },
    );

    if (response.data == null) return null;

    return GeoJSONFeatureCollection.fromMap(response.data!);
  }

  Future<GeoJSONFeatureCollection?> searchStructured(SearchQuery query) async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.search.url,
      queryParameters: query.toMap(),
    );

    if (response.data == null) return null;

    return GeoJSONFeatureCollection.fromMap(response.data!);
  }

  Future<GeoJSON?> reverse(LatLng position) async {
    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.reverse.url,
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return GeoJSON.fromMap(response.data!);
  }

  Future<GeoJSONFeatureCollection?> lookup(List<OsmId> osmIds) async {
    List<String> osmIdStrings = [];

    for (final id in osmIds) {
      osmIdStrings.add('${id.type.name[0]}${id.value}');
    }

    final response = await _dioClient.get<Map<String, dynamic>>(
      NominatimRoute.lookup.url,
      queryParameters: {
        'osm_ids': osmIdStrings.join(','),
        'format': 'json'
      },
    );

    if (response.data == null) return null;

    return GeoJSONFeatureCollection.fromMap(response.data!);
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