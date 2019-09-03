
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clinic_data.g.dart';

@JsonSerializable()
class Office {
  Office({
    this.address,
    this.lat,
    this.long,
    this.name,
    this.phone,
    this.location,
    this.city,
    this.district,
    this.state,
    this.type,
    this.fax,
    this.antropometri,
    this.physical,
    this.development,
    this.imunisasi,
    this.consultation
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);

  final String address;
  final double lat;
  final double long;
  final String name;
  final String phone;
  final String location;
  final String city;
  final String district;
  final String state;
  final String type;
  final String fax;
  final String antropometri;
  final String physical;
  final String development;
  final String imunisasi;
  final String consultation;
}

@JsonSerializable()
class Locations {
  Locations({
    this.offices,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Office> offices;
}

Future<Locations> getClinics(BuildContext context) async {
  // Retrieve the locations of Google offices
  final response = json.decode(await
      DefaultAssetBundle.of(context).loadString("data/file.json")
  );
  return Locations.fromJson(response);
}