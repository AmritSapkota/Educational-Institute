import 'package:educational_institute/widgets/my_student.dart';
import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Student Information'),
          ),
          body: ListView(
            children: [
              StudentInCardView(),
              StudentInCardView(),
              StudentInCardView(),
              StudentInCardView(),
              StudentInCardView(),
            ],
          ),
        ),
      ),
    );
  }
}
