class Address {
  String? city;
  String? county;
  String? state;
  String? iso31662Lvl4;
  String? postcode;
  String country;
  String countryCode;
  String? hamlet;
  String? neighbourhood;
  String? village;
  String? municipality;
  String? iso31662Lvl6;
  String? region;

  Address({
    this.city,
    this.county,
    this.state,
    this.iso31662Lvl4,
    this.postcode,
    required this.country,
    required this.countryCode,
    this.hamlet,
    this.neighbourhood,
    this.village,
    this.municipality,
    this.iso31662Lvl6,
    this.region,
  });

  factory Address.fromMap(Map<String, dynamic> map) => Address(
    city: map["city"],
    county: map["county"],
    state: map["state"],
    iso31662Lvl4: map["ISO3166-2-lvl4"],
    postcode: map["postcode"],
    country: map["country"],
    countryCode: map["country_code"],
    hamlet: map["hamlet"],
    neighbourhood: map["neighbourhood"],
    village: map["village"],
    municipality: map["municipality"],
    iso31662Lvl6: map["ISO3166-2-lvl6"],
    region: map["region"],
  );

  Map<String, dynamic> toMap() => {
    "city": city,
    "county": county,
    "state": state,
    "ISO3166-2-lvl4": iso31662Lvl4,
    "postcode": postcode,
    "country": country,
    "country_code": countryCode,
    "hamlet": hamlet,
    "neighbourhood": neighbourhood,
    "village": village,
    "municipality": municipality,
    "ISO3166-2-lvl6": iso31662Lvl6,
    "region": region,
  };
}