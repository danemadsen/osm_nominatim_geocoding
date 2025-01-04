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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    stateDistrict: json["state_district"],
    state: json["state"],
    iso31662Lvl4: json["ISO3166-2-lvl4"],
    postcode: json["postcode"],
    country: json["country"],
    countryCode: json["country_code"],
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