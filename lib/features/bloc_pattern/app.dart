import 'package:flutter/material.dart';
import 'package:my_flutter_template/features/bloc_pattern/ui/movie_list.dart';

class BlocApp extends StatelessWidget {
  BlocApp({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: MovieList(),
    );
  }
}
// complete tutorial: https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1