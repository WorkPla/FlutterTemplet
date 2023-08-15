import 'package:flutter/material.dart';
import 'package:my_flutter_template/features/home/home_page_cell.dart';
import 'package:my_flutter_template/features/responsive_ui_flutter_screenutil_pub/responsive_ui.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var topics = ['Responsive Login Page'];
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Real World App"),
        ),
        body: new Center(
          child: new ListView.builder(
            itemCount: topics != null ? topics.length : 0,
            itemBuilder: (context, index) {
              final topic = topics[index];
              return new TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: Colors.white),
                  onPressed: () {
                    print("Pressed on => $topic");
                    if (index == 0) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ResponsiveLoginPage(
                                    title: "Responsive Login Page",
                                  )));
                    }
                  },
                  child: new HomeTableCell(topic));
            },
          ),
        ),
      ),
    );
  }
}
