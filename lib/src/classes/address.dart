class Address {
  String city;
  String stateDistrict;
  String state;
  String iso31662Lvl4;
  String postcode;
  String country;
  String countryCode;

  Address({
    required this.city,
    required this.stateDistrict,
    required this.state,
    required this.iso31662Lvl4,
    required this.postcode,
    required this.country,
    required this.countryCode,
  });

  factory Address.fromMap(Map<String, dynamic> map) => Address(
    city: map["city"],
    stateDistrict: map["state_district"],
    state: map["state"],
    iso31662Lvl4: map["ISO3166-2-lvl4"],
    postcode: map["postcode"],
    country: map["country"],
    countryCode: map["country_code"],
  );

  Map<String, dynamic> toMap() => {
    "city": city,
    "state_district": stateDistrict,
    "state": state,
    "ISO3166-2-lvl4": iso31662Lvl4,
    "postcode": postcode,
    "country": country,
    "country_code": countryCode,
  };
}