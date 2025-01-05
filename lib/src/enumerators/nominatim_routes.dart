enum NominatimRoute {
  search,
  reverse,
  lookup,
  status,
  deletable,
  polygons,
  details;

  static const String _baseUrl = 'https://nominatim.openstreetmap.org';

  String get url => '$_baseUrl/$name';
}