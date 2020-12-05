import 'package:educational_institute/Services/readmore_text.dart';
import 'package:educational_institute/models/seminar_model.dart';
import 'package:flutter/material.dart';

class Seminar extends StatelessWidget {
  SeminarModel seminar;
  Seminar({@required this.seminar});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.05),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.015),

        // height: size.height * 0.3,
        // width: size.width,
        constraints: BoxConstraints(
          minHeight: size.height * 0.1,
          minWidth: size.width,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  color: Colors.blue,
                  size: size.height * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  'Educational Institute',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ReadMoreText(
              seminar.description,
              trimLines: 3,
              colorClickableText: Colors.blueAccent,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Show more',
              trimExpandedText: ' show less',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "University/Country: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(seminar.title),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Date: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                    '${seminar.date.year}-${seminar.date.month}-${seminar.date.day}'),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Location: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(seminar.location),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              RaisedButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text(
                  'Join Meeting',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
