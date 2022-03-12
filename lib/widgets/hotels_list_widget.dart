import 'package:flutter/material.dart';
import 'package:skillbox_9_5/models/hotel.dart';

final TextStyle _textStyleHeader = TextStyle(fontSize: 16);

class HotelsWidget extends StatefulWidget {
  HotelsWidget({Key? key}) : super(key: key);

  @override
  State<HotelsWidget> createState() => _HotelsWidgetState();
}

class _HotelsWidgetState extends State<HotelsWidget> {
  bool _isGrid = false;

  final List<Hotel> _fakeData = [
    Hotel(
        uuid: "4651684", name: 'классный отель', poster: "disney_dreams_1.jpg"),
    Hotel(uuid: "5893245", name: 'cool hotel', poster: "golden_ratio_1.jpg"),
    Hotel(
        uuid: "4651684", name: 'классный отель', poster: "disney_dreams_1.jpg"),
    Hotel(uuid: "5893245", name: 'cool hotel', poster: "golden_ratio_1.jpg"),
    Hotel(
        uuid: "4651684", name: 'классный отель', poster: "disney_dreams_1.jpg"),
    Hotel(uuid: "5893245", name: 'cool hotel', poster: "golden_ratio_1.jpg"),
    Hotel(
        uuid: "4651684", name: 'классный отель', poster: "disney_dreams_1.jpg"),
    Hotel(uuid: "5893245", name: 'cool hotel', poster: "golden_ratio_1.jpg"),
  ];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: _onTabList, icon: Icon(Icons.list)),
            IconButton(onPressed: _onTabGrid, icon: Icon(Icons.apps)),
          ],
        ),
        body: _isGrid
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _fakeData.length,
                itemBuilder: (context, index) {
                  return _CardForGrid(hotel: _fakeData[index]);
                })
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                    itemCount: _fakeData.length,
                    itemBuilder: (context, index) {
                      return _CardForList(hotel: _fakeData[index]);
                    }),
              ),
      ),
    );
  }
}

class _CardForList extends StatelessWidget {
  final Hotel hotel;
  _CardForList({required this.hotel, Key? key}) : super(key: key);
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
                      onPressed: () {}, child: const Text('Подробнее')),
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
  _CardForGrid({required this.hotel, Key? key}) : super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(hotel.name, style: _textStyleHeader),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Ink(
                height: null,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
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
