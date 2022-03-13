import 'package:json_annotation/json_annotation.dart';
import 'package:skillbox_9_5/models/address.dart';
import 'package:skillbox_9_5/models/services.dart';

part 'hotel_details.g.dart';

@JsonSerializable()
class HotelDetails {
  String uuid;
  String name;
  String poster;
  Addsess address;
  double price;
  double rating;
  Services services;
  List<String> photos;

  HotelDetails(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.address,
      required this.price,
      required this.rating,
      required this.services,
      required this.photos});

  factory HotelDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsFromJson(json);
}
