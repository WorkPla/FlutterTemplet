import 'package:flutter/material.dart';
import 'package:my_flutter_template/features/http_call/home/ui.dart';

class NetworkingExp extends StatelessWidget {
  NetworkingExp({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: HttpCall(navTitle: title));
  }
}
// https://medium.com/@rajajawahar77/create-your-first-api-call-in-flutter-a04d023ebd50
// https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1