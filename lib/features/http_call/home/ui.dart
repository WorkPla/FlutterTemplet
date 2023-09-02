import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_template/features/http_call/home/list_cell.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpCall extends StatefulWidget {
  final String navTitle;
  HttpCall({super.key, required this.navTitle});

  @override
  State<StatefulWidget> createState() {
    return new SimpleListView();
  }
}

class SimpleListView extends State<HttpCall> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _isLoading = true;
  //     _fetchData();
  //   });
  // }

  var _apiData = [];
  var _isLoading = false;
  _fetchData() async {
    try {
      print("Attempting to fetch data by http request...");

      final url = "https://api.github.com/users";
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 3));
      final _data = json.decode(response.body);
      print(_data);
      setState(() {
        _apiData = _data;
        _isLoading = false;
      });
    } on TimeoutException catch (_) {
      // A timeout occurred.
      print('Time out - https://api.github.com/users');
    } on SocketException catch (_) {
      // Other exception
      print('Socket Exception - https://api.github.com/users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navTitle),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              print("Press on Reloading Button...");
              setState(() {
                _isLoading = true;
                _fetchData();
              });
            },
          )
        ],
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this._apiData != null ? this._apiData.length : 0,
                itemBuilder: (context, index) {
                  final _currentData = this._apiData[index];
                  return new TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    //padding: new EdgeInsets.all(0.0),
                    onPressed: () {
                      print("Pressed on celll number $index");
                      // Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //         builder: (context) => new DetailPage()));
                    },
                    child: new ListCell(_currentData),
                  );
                },
              ),
      ),
    );
  }
}
