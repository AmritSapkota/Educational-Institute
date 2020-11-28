import 'package:educational_institute/Services/readmore_text.dart';
import 'package:flutter/material.dart';

class SeminarPost extends StatelessWidget {
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
          minHeight: size.height * 0.2,
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
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.01))),
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
              'Description of the nation as of it is  in the nepali nation and the order of the nation is really intriguging as of now in order to build a university of your choice is just a dummy text',
              trimLines: 3,
              colorClickableText: Colors.blueAccent,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Show more',
              trimExpandedText: ' show less',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text('Time : 10.00pm +GST'),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text('Location : Seoul, Gwanjin-Gu, Gunja-ro, 18 gil'),
            SizedBox(
              height: size.height * 0.01,
            ),
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
