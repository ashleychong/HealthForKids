// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
      address: json['address'] as String,
      lat: (json['lat'] as num)?.toDouble(),
      long: (json['long'] as num)?.toDouble(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      state: json['state'] as String,
      type: json['type'] as String,
      fax: json['fax'] as String,
      antropometri: json['antropometri'] as String,
      physical: json['physical'] as String,
      development: json['development'] as String,
      imunisasi: json['imunisasi'] as String,
      consultation: json['consultation'] as String);
}

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'address': instance.address,
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'phone': instance.phone,
      'location': instance.location,
      'city': instance.city,
      'district': instance.district,
      'state': instance.state,
      'type': instance.type,
      'fax': instance.fax,
      'antropometri': instance.antropometri,
      'physical': instance.physical,
      'development': instance.development,
      'imunisasi': instance.imunisasi,
      'consultation': instance.consultation
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      offices: (json['offices'] as List)
          ?.map((e) =>
              e == null ? null : Office.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LocationsToJson(Locations instance) =>
    <String, dynamic>{'offices': instance.offices};
