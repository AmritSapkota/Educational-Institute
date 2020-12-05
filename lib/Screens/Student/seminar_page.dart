import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/models/seminar_model.dart';
import 'package:educational_institute/widgets/my_seminar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '';

class SeminarPage extends StatelessWidget {
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
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('seminars').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'No Seminar is available yet',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Something Went Wrong!'),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot seminar =
                            snapshot.data.documents[index];
                        SeminarModel seminarModel =
                            SeminarModel.fromJason(seminar.data());
                        return Seminar(
                          seminar: seminarModel,
                        );
                      });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
