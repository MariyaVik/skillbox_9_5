import 'package:flutter/material.dart';
import 'package:skillbox_9_5/models/hotel.dart';
import 'package:skillbox_9_5/widgets/hotel_details_widget.dart';

import 'widgets/hotels_list_widget.dart';

abstract class NavRouteName {
  static const home = '/';
  static const hotelDetails = '/details';
}

class Navigation {
  static const initialRoute = NavRouteName.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavRouteName.home:
        return MaterialPageRoute(builder: (context) => const HotelsWidget());
      case NavRouteName.hotelDetails:
        final arg = settings.arguments as Hotel;
        return MaterialPageRoute(
            builder: (context) => HotelDetailsWidget(
                  currentHotel: arg,
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Text('Navigation error!!!'));
    }
  }
}
