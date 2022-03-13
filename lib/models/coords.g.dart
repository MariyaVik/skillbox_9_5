// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lan'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'lat': instance.latitude,
      'lan': instance.longitude,
    };
