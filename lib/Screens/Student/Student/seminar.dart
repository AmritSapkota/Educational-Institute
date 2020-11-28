import 'package:educational_institute/widgets/my_seminar.dart';
import 'package:flutter/material.dart';

class SeminarPage extends StatelessWidget {
  String data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text(
              "Seminar",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.03,
                right: size.width * 0.03),
            child: data == null
                ? ListView(
                    children: [
                      SeminarPost(),
                      SeminarPost(),
                      SeminarPost(),
                      SeminarPost(),
                      SeminarPost(),
                      SeminarPost(),
                    ],
                  )
                : Center(
                    child: Text(
                      'No Seminar is available yet',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
