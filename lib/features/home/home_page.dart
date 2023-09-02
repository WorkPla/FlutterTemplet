import 'package:flutter/material.dart';
import 'package:my_flutter_template/features/db_offline/ui%20/note_page.dart';
import 'package:my_flutter_template/features/dropdown_popups/home.dart';
import 'package:my_flutter_template/features/home/home_page_cell.dart';
import 'package:my_flutter_template/features/responsive_ui_flutter_screenutil_pub/responsive_ui.dart';
import 'package:my_flutter_template/features/firebase_auth/mobile_info.dart';
import 'package:my_flutter_template/features/http_call/app.dart';
import 'package:my_flutter_template/features/bloc_pattern/app.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var topics = [
      'Responsive Login Page',
      'Firebase Auth',
      'Bloc Pattern',
      'Offline DB',
      'Networking',
      'Flutter Alerts'
    ];
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
                                    title: topic,
                                  )));
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new MobileInfo(
                                    title: topic,
                                  )));
                    } else if (index == 2) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new BlocApp(
                                    title: "Bloc Pattern",
                                  )));
                    } else if (index == 3) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new NotesPage()));
                    } else if (index == 4) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new NetworkingExp(
                                    title: 'Http Request',
                                  )));
                    } else if (index == 5) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Alerts(
                                    title: topic,
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
