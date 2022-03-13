import 'package:json_annotation/json_annotation.dart';

part 'services.g.dart';

@JsonSerializable()
class Services {
  List<String> free;
  List<String> paid;

  Services({required this.free, required this.paid});

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
}
