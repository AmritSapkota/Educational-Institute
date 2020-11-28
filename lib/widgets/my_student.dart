import 'package:flutter/material.dart';

class StudentInCardView extends StatelessWidget {
  String _stuentNameFirstLetter = 'A';
  String _studentName = 'Amrit Sapkota';
  String _universityName = 'Sejong University';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.02,
          right: size.width * 0.02),
      child: Card(
        //margin: EdgeInsets.all(size.height),
        elevation: size.height * 0.02,
        //clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              CircleAvatar(
                child: Text(_stuentNameFirstLetter),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _studentName,
                      style: TextStyle(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          _universityName,
                          //style: TextStyle(fontSize: size.height * 0.03),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
