class StructuredSearchQuery {
  final String? amenity;
  final String? street;
  final String? city;
  final String? county;
  final String? state;
  final String? country;
  final int? postCode;

  StructuredSearchQuery({
    this.amenity,
    this.street,
    this.city,
    this.county,
    this.state,
    this.country,
    this.postCode,
  });

  @override
  String toString() {
    String query = '?';

    if (amenity != null) {
      query += 'amenity=$amenity&';
    }

    if (street != null) {
      query += 'street=$street&';
    }

    if (city != null) {
      query += 'city=$city&';
    }

    if (county != null) {
      query += 'county=$county&';
    }

    if (state != null) {
      query += 'state=$state&';
    }

    if (country != null) {
      query += 'country=$country&';
    }

    if (postCode != null) {
      query += 'postalcode=$postCode';
    }

    return query.replaceAll(' ', '+');
  }
}