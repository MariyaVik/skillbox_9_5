import 'package:flutter/material.dart';
import 'package:skillbox_9_5/models/hotel.dart';

class HotelDetailsWidget extends StatefulWidget {
  Hotel currentHotel;
  HotelDetailsWidget({required this.currentHotel, Key? key}) : super(key: key);

  @override
  State<HotelDetailsWidget> createState() => _HotelDetailsWidgetState();
}

class _HotelDetailsWidgetState extends State<HotelDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
