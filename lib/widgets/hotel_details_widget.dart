import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skillbox_9_5/models/hotel.dart';
import 'package:skillbox_9_5/models/hotel_details.dart';
import 'package:carousel_slider/carousel_slider.dart';

const TextStyle _textStyleMainInfo =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

class HotelDetailsWidget extends StatefulWidget {
  final Hotel currentHotel;
  const HotelDetailsWidget({required this.currentHotel, Key? key})
      : super(key: key);

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
                ? const Center(child: CircularProgressIndicator())
                : hasError
                    ? Center(
                        child: Text(errorMessage),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _PhotoCarousel(hotel: curHotel),
                            _MainInfo(hotel: curHotel),
                            _Services(hotel: curHotel),
                          ],
                        ),
                      )));
  }
}

class _MainInfo extends StatelessWidget {
  final HotelDetails hotel;
  const _MainInfo({required this.hotel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<List> _mainInfoHeaders = [
      ['Страна: ', hotel.address.country],
      ['Город: ', hotel.address.city],
      ['Улица: ', hotel.address.street],
      ['Рейтинг: ', hotel.rating]
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: _mainInfoHeaders
              .map<Widget>((e) => Row(
                    children: [
                      Text(e[0]),
                      Text(e[1].toString(), style: _textStyleMainInfo)
                    ],
                  ))
              .toList()),
    );
  }
}

class _Services extends StatelessWidget {
  final HotelDetails hotel;
  const _Services({required this.hotel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Сервисы', style: TextStyle(fontSize: 24)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Платные', style: TextStyle(fontSize: 20)),
                    ),
                    ...hotel.services.paid.map<Widget>((e) => Text(e)).toList()
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Бесплатно', style: TextStyle(fontSize: 20)),
                    ),
                    ...hotel.services.free.map<Widget>((e) => Text(e)).toList()
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PhotoCarousel extends StatefulWidget {
  final HotelDetails hotel;
  const _PhotoCarousel({required this.hotel, Key? key}) : super(key: key);

  @override
  State<_PhotoCarousel> createState() => __PhotoCarouselState();
}

class __PhotoCarouselState extends State<_PhotoCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.hotel.photos.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: 300,
            width: 400,
            child: Image(
              image: AssetImage("assets/images/" + widget.hotel.photos[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(),
    );
  }
}
