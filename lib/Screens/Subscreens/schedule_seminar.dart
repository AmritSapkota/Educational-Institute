import 'package:educational_institute/widgets/date_dart.dart';
import 'package:flutter/material.dart';

class ScheduleSeminar extends StatefulWidget {
  @override
  _ScheduleSeminarState createState() => _ScheduleSeminarState();
}

class _ScheduleSeminarState extends State<ScheduleSeminar> {
  DateTime _eventDate;

  changedEventDate(value) {
    setState(() {
      _eventDate = value;
    });
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
                    child: Column(
                      children: [
                        Text(
                          'Seminar Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.03),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter University/Country Name',
                              labelText: 'University / Country'),
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
                              onPressed: () {},
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue,
                              onPressed: () {},
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
