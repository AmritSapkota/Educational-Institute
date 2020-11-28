import 'package:flutter/material.dart';

class ManagePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Manage Post",
            ),
          ),
        ),
      ),
    );
  }
}
