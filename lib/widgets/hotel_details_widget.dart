import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skillbox_9_5/models/hotel.dart';
import 'package:skillbox_9_5/models/hotel_details.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelDetailsWidget extends StatefulWidget {
  Hotel currentHotel;
  HotelDetailsWidget({required this.currentHotel, Key? key}) : super(key: key);

  @override
  State<HotelDetailsWidget> createState() => _HotelDetailsWidgetState();
}

class _HotelDetailsWidgetState extends State<HotelDetailsWidget> {
  Dio dio = Dio();
  late HotelDetails curHotel;
  bool isLoading = false;
  bool hasError = false;
  late String errorMessage;
  String title = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response =
          await dio.get('https://run.mocky.io/v3/${widget.currentHotel.uuid}');
      curHotel = HotelDetails.fromJson(response.data);
      title = curHotel.name;
    } on DioError catch (e) {
      hasError = true;
      if (e.response != null) {
        errorMessage = e.response!.data['message'];
      } else {
        errorMessage = e.message;
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              centerTitle: true,
            ),
            body: isLoading
                ? Center(child: CircularProgressIndicator())
                : hasError
                    ? Center(
                        child: Text(errorMessage),
                      )
                    : Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: curHotel.photos.length,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  height: 300,
                                  width: 400,
                                  child: Image(
                                    image: AssetImage("assets/images/" +
                                        curHotel.photos[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                // enlargeCenterPage: true,
                                ),
                          ),
                        ],
                      )));
  }
}
