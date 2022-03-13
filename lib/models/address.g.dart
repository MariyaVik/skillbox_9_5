// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addsess _$AddsessFromJson(Map<String, dynamic> json) => Addsess(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      zipCode: json['zip_code'] as int,
      coords: Coords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddsessToJson(Addsess instance) => <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zipCode,
      'coords': instance.coords,
    };
