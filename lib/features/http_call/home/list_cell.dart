import 'package:flutter/material.dart';

class ListCell extends StatelessWidget {
  final _apiData;
  ListCell(this._apiData);

  Widget build(BuildContext context) {
    var id = _apiData['id'];
    var name = _apiData['login'];
    var avatar_url = _apiData['avatar_url'];

    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(avatar_url),
              new Container(
                height: 8.0,
              ),
              new Text(
                'ID: $id',
                style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              new Container(
                height: 8.0,
              ),
              new Text(
                'Name: $name',
                style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              new Container(
                height: 8.0,
              ),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
