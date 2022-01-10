import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List myList = [];
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    myList = List.generate(_currentMax, (i) => 'Item: ${i + 1}');
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      myList.add('Item: ${i + 1}');
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading More'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemExtent: 70,
        itemBuilder: (context, i) {
          if(i==myList.length){
            return CupertinoActivityIndicator();
          }
          return ListTile(
            title: Text(myList[i]),
          );
        },
        itemCount: myList.length,
      ),
    );
  }
}
