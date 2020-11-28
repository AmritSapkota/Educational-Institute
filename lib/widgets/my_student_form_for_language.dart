import 'package:educational_institute/models/applied_university_form_model.dart';
import 'package:educational_institute/models/booked_class_form_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyStudentFormForLanguage extends StatefulWidget {
  BookedFormModel student;
  MyStudentFormForLanguage({@required this.student});
  @override
  _MyStudentFormForLanguageState createState() =>
      _MyStudentFormForLanguageState();
}

class _MyStudentFormForLanguageState extends State<MyStudentFormForLanguage> {
  @override
  void initState() {
    print("${widget.student.firstName}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.03),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.height * 0.05)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03),
                    //color: Colors.white,
                    height: size.height,
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Scrollable Booking form',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // CircleAvatar(
                          //     child: widget.student.imageURL == null
                          //         ? Text(widget.student.firstName[0])
                          //         : Image.network(
                          //             'https://github.com/flutter/flutter/issues/19309')),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FieldInApplicationForm(
                            subTitle: 'Name',
                            title: widget.student.firstName +
                                " " +
                                widget.student.lastName,
                            icon: Icons.account_circle,
                          ),
                          FieldInApplicationForm(
                            subTitle: 'Email',
                            title: widget.student.email,
                            icon: Icons.email,
                          ),
                          FieldInApplicationForm(
                            subTitle: 'Mobile',
                            title: widget.student.phoneNo,
                            icon: Icons.phone,
                          ),
                          FieldInApplicationForm(
                            subTitle: 'Gender',
                            title: widget.student.gender,
                            icon: Icons.people,
                          ),
                          FieldInApplicationForm(
                              subTitle: 'StartingAt',
                              title:
                                  '${widget.student.estimatedStartingDate.year}-${widget.student.estimatedStartingDate.month}-${widget.student.estimatedStartingDate.day}',
                              icon: Icons.calendar_today),
                          FieldInApplicationForm(
                            subTitle: 'Shift',
                            title: widget.student.shift,
                            icon: Icons.timelapse,
                          ),
                          FieldInApplicationForm(
                            subTitle: 'Class Type',
                            title: widget.student.choosedClass,
                            icon: Icons.insert_drive_file,
                          ),
                          FieldInApplicationForm(
                            subTitle: 'Payment',
                            title: widget.student.paymentOption,
                            icon: Icons.flag,
                          ),
                          widget.student.receiptURL == ''
                              ? Container(
                                  child: Text(
                                    'No Receipt Available',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.only(
                                    bottom: size.width * 0.03,
                                  ),
                                  height: size.height * 0.3,
                                  width: size.width,
                                  child: Image.network(
                                    widget.student.receiptURL,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.5,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close', style: TextStyle(color: Colors.white)),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FieldInApplicationForm extends StatelessWidget {
  String title;
  IconData icon;
  String subTitle;
  FieldInApplicationForm(
      {this.subTitle, @required this.icon, @required this.title});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Container(
        //height: size.height * 0.07,
        //padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
        ),
        width: size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(icon),
                  ),
                  subTitle != null
                      ? Text(
                          subTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '$title',
                style: TextStyle(
                  //textBaseline: TextBaseline.alphabetic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
