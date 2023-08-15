import 'package:flutter/material.dart';

class HomeTableCell extends StatelessWidget {
  final topic;
  HomeTableCell(this.topic);

  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                topic,
                style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
