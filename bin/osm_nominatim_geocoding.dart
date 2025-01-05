import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim_geocoding/osm_nominatim_geocoding.dart';

void main(List<String> arguments) {
  final nominatim = Nominatim();
  final places = nominatim.search(q: '1600 Amphitheatre Parkway, Mountain View, CA');
  places.then((value) {
    if (value != null) {
      for (final place in value) {
        print(place.displayName);
        print(place.osmId);
        print(place.osmType);
      }
    }
  });

  final place = nominatim.reverse(LatLng(37.422, -122.084));
  place.then((value) {
    if (value != null) {
      print(value.displayName);
    }
  });

  final places2 = nominatim.lookup({23733659: OsmType.way, 2192620021: OsmType.node});

  places2.then((value) {
    if (value != null) {
      for (final place in value) {
        print(place.displayName);
        print(place.osmId);
        print(place.osmType);
      }
    }
  });
}
