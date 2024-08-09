import 'package:appscrip/model/geo_model.dart';

class Address {
  String? street;
  String? suit;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.city, this.suit, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      suit: json["suite"],
      city: json["city"],
      zipcode: json["zipcode"],
      geo: json["geo"] != null
          ? Geo.fromJson(
              json["geo"],
            )
          : null,
    );
  }
}
