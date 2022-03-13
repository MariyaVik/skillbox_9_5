import 'package:json_annotation/json_annotation.dart';
import 'package:skillbox_9_5/models/coords.dart';

part 'address.g.dart';

@JsonSerializable()
class Addsess {
  String country;
  String street;
  String city;
  @JsonKey(name: 'zip_code')
  int zipCode;
  Coords coords;

  Addsess(
      {required this.country,
      required this.street,
      required this.city,
      required this.zipCode,
      required this.coords});

  factory Addsess.fromJson(Map<String, dynamic> json) =>
      _$AddsessFromJson(json);
}
