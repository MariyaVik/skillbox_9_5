import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skillbox_9_5/models/hotel.dart';
import 'package:skillbox_9_5/navigation.dart';

const TextStyle _textStyleHeader = TextStyle(fontSize: 16);

class HotelsWidget extends StatefulWidget {
  const HotelsWidget({Key? key}) : super(key: key);

  @override
  State<HotelsWidget> createState() => _HotelsWidgetState();
}

class _HotelsWidgetState extends State<HotelsWidget> {
  bool _isGrid = false;
  Dio dio = Dio();
  List<Hotel> hotels = [];
  bool isLoading = false;
  bool hasError = false;
  late String errorMessage;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _onTabList() {
    if (_isGrid) {
      _isGrid = false;
      setState(() {});
    }
  }

  void _onTabGrid() {
    if (!_isGrid) {
      _isGrid = true;
      setState(() {});
    }
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await dio
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      hotels = response.data.map<Hotel>((e) => Hotel.fromJson(e)).toList();
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
          actions: [
            IconButton(onPressed: _onTabList, icon: const Icon(Icons.list)),
            IconButton(onPressed: _onTabGrid, icon: const Icon(Icons.apps)),
          ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : hasError
                ? Center(
                    child: Text(errorMessage),
                  )
                : _isGrid
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: hotels.length,
                        itemBuilder: (context, index) {
                          return _CardForGrid(hotel: hotels[index]);
                        })
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView.builder(
                            itemCount: hotels.length,
                            itemBuilder: (context, index) {
                              return _CardForList(hotel: hotels[index]);
                            }),
                      ),
      ),
    );
  }
}

class _CardForList extends StatelessWidget {
  final Hotel hotel;
  const _CardForList({required this.hotel, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Ink.image(
            image: AssetImage("assets/images/" + hotel.poster),
            height: MediaQuery.of(context).size.height / 4,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 12,
              child: Row(
                children: [
                  Expanded(child: Text(hotel.name, style: _textStyleHeader)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            NavRouteName.hotelDetails,
                            arguments: hotel);
                      },
                      child: const Text('Подробнее')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardForGrid extends StatelessWidget {
  final Hotel hotel;
  const _CardForGrid({required this.hotel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Ink.image(
              image: AssetImage("assets/images/" + hotel.poster),
              height: null,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
                child: Text(hotel.name,
                    style: _textStyleHeader, textAlign: TextAlign.center)),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(NavRouteName.hotelDetails, arguments: hotel);
              },
              child: Ink(
                height: null,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                    child: Text(
                  'Подробнее',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
