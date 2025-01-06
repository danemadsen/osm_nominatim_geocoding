class SearchQuery {
  final String? amenity;
  final String? street;
  final String? city;
  final String? county;
  final String? state;
  final String? country;
  final int? postCode;
  final int? limit;

  SearchQuery({
    this.amenity,
    this.street,
    this.city,
    this.county,
    this.state,
    this.country,
    this.postCode,
    this.limit,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {'format': 'json'};
    if (amenity != null) map['amenity'] = amenity;
    if (street != null) map['street'] = street;
    if (city != null) map['city'] = city;
    if (county != null) map['county'] = county;
    if (state != null) map['state'] = state;
    if (country != null) map['country'] = country;
    if (postCode != null) map['postalcode'] = postCode;
    if (limit != null) map['limit'] = limit;
    return map;
  }
}