import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/models/seminar_model.dart';
import 'package:educational_institute/widgets/date_dart.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScheduleSeminar extends StatefulWidget {
  @override
  _ScheduleSeminarState createState() => _ScheduleSeminarState();
}

class _ScheduleSeminarState extends State<ScheduleSeminar> {
  //for Seminar
  DateTime _eventDate = DateTime.now();
  TextEditingController _description = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _link = TextEditingController();
  TextEditingController _location = TextEditingController();

  changedEventDate(value) {
    setState(() {
      _eventDate = value;
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey();

  resetForm() {
    _link.clear();
    _title.clear();
    _description.clear();
    _eventDate = DateTime.now();
    _location.clear();
  }

  dialogOnSubmitButton() => showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) {
        Widget cancelButton = FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        );
        Widget continueButton = FlatButton(
          child: Text("Continue"),
          onPressed: () {
            Navigator.pop(context);
            uploadSeminar();
          },
        );
        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("Confirmation"),
          content:
              Text("Seminar is going to be upload. Do you want to continue?"),
          actions: [
            cancelButton,
            continueButton,
          ],
        );
        return alert;
      });
  uploadSeminar() async {
    SeminarModel seminar = SeminarModel(
      title: _title.text,
      description: _description.text,
      date: _eventDate,
      eId: '',
      location: _location.text,
      link: _link.text,
    );
    await DatabaseService().seminarToDatabase(seminar).then((value) {
      showDialog(
          context: context,
          builder: (context) {
            Widget cancelButton = FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            );
            AlertDialog alert = AlertDialog(
              title: Text("Success"),
              content: Text("Post uploaded Successfully"),
              actions: [
                cancelButton,
              ],
            );
            return alert;
          });
    });
    resetForm();
  }

  final double sizeBox = 0.02;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Schedule Seminar'),
          ),
          body: Stack(
            children: [
              // Container(
              //   color: Colors.blue.withOpacity(0.4),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.02),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Seminar Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.03),
                        ),
                        SizedBox(
                          height: size.height * sizeBox,
                        ),
                        TextFormField(
                          controller: _title,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter University/Country Name',
                              labelText: 'University / Country'),
                        ),
                        SizedBox(
                          height: size.height * sizeBox,
                        ),
                        TextFormField(
                          controller: _location,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter seminar Location',
                              labelText: 'Location'),
                        ),
                        SizedBox(
                          height: size.height * sizeBox,
                        ),
                        DateTimePicker(
                          setDate: changedEventDate,
                          color: Colors.grey[600],
                          title: 'Event Date: ',
                        ),
                        SizedBox(
                          height: size.height * sizeBox,
                        ),
                        Row(
                          children: [
                            Text('Add Details'),
                            SizedBox(
                              width: size.width * sizeBox,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _description,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Description',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * sizeBox,
                        ),
                        TextFormField(
                          controller: _link,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Meeting Link',
                              hintText: 'www.example.com/conference/video'),
                        ),
                        SizedBox(
                          height: size.height * sizeBox,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                dialogOnSubmitButton();
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  resetForm();
                                });
                              },
                              child: Text(
                                'Reset',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
