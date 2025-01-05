import 'package:osm_nominatim_geocoding/osm_nominatim_geocoding.dart';

void main() async {
  List<OsmId> osmIds = [];
  final nominatim = Nominatim();
  final places = await nominatim.search(q: 'Bei Jing');
  for (final place in places!) {
    osmIds.add(place.osmId);
  }

  final place = await nominatim.reverse(places.first.position);
  print(place!.displayName);

  final places2 = await nominatim.lookup(osmIds);
  for (final place in places2!) {
    print(place.displayName);
  }

  final detailsPlace = await nominatim.details(places.first.placeId);
  print(detailsPlace!.countryCode);
}
