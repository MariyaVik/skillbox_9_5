import 'package:flutter/material.dart';

class HotelsWidget extends StatefulWidget {
  HotelsWidget({Key? key}) : super(key: key);

  @override
  State<HotelsWidget> createState() => _HotelsWidgetState();
}

class _HotelsWidgetState extends State<HotelsWidget> {
  bool _isGrid = false;
  final List<String> _fakeData = ['1', '2'];

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
                  return Card(child: Text(_fakeData[index]));
                })
            : ListView.builder(
                itemCount: _fakeData.length,
                itemBuilder: (context, index) {
                  return Card(child: Text(_fakeData[index]));
                }),
      ),
    );
  }
}
