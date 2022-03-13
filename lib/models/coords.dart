import 'package:json_annotation/json_annotation.dart';

part 'coords.g.dart';

@JsonSerializable()
class Coords {
  @JsonKey(name: 'lat')
  double latitude;
  @JsonKey(name: 'lan')
  double longitude;

  Coords({required this.latitude, required this.longitude});

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
}
