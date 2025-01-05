import 'package:osm_nominatim_geocoding/osm_nominatim_geocoding.dart';

void main(List<String> arguments) {
  final nominatim = Nominatim();
  final places = nominatim.search(q: '1600 Amphitheatre Parkway, Mountain View, CA');
  places.then((value) {
    for (var place in value) {
      print(place.displayName);
    }
  });
}
