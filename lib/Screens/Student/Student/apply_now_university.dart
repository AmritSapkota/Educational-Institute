import 'dart:io';
import 'package:educational_institute/widgets/date_dart.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ApplyNowForUniversity extends StatefulWidget {
  @override
  _ApplyNowForUniversityState createState() => _ApplyNowForUniversityState();
}

//TODO: validation for all the field
class _ApplyNowForUniversityState extends State<ApplyNowForUniversity> {
  DateTime dob;
  changeDob(newValue) {
    setState(() {
      dob = newValue;
    });
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String _selectedGender;

  List<String> gender = [
    'Gender : male',
    'Gender : female',
    'Gender : private'
  ];

  GlobalKey<FormState> _formKey = GlobalKey();
  String _textFieldValidator(value) {
    if (value.isEmpty) {
      return 'required field';
    }
    return null;
  }

  String _emailValidator(value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  String _genderValidator(value) {
    if (value == null) return 'Please Select Gender*';
    return null;
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Application form',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Form(
                          key: _formKey,
                          child: Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'First Name',
                                            prefixIcon:
                                                Icon(Icons.account_circle),
                                          ),
                                          validator: _textFieldValidator,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.03,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          validator: _textFieldValidator,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.account_circle),
                                            border: OutlineInputBorder(),
                                            labelText: 'Last Name',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          border: OutlineInputBorder(),
                                          labelText: 'Email',
                                          hintText: 'example@gmail.com'),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.phone_android),
                                          border: OutlineInputBorder(),
                                          labelText: 'Phone',
                                          hintText: '+977-00000-00000'),
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.07,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[400]),
                                    ),
                                    width: size.width,
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        child: DropdownButton<String>(
                                          icon: Icon(Icons.menu),
                                          hint: Text(
                                            'Gender',
                                            textAlign: TextAlign.center,
                                          ),
                                          value: _selectedGender,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedGender = newValue;
                                            });
                                          },
                                          items: gender.map((accountType) {
                                            return DropdownMenuItem(
                                              value: accountType,
                                              child: Center(
                                                  child: Text(accountType)),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DateTimePicker(
                                    title: "Date of Birth",
                                    setDate: changeDob,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: size.height * 0.07,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[400]),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: size.width * 0.05,
                                              left: size.width * 0.05),
                                          child: Text(
                                            'image',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.05,
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                          onPressed: () {
                                            getImage();
                                          },
                                          child: Text('Choose File'),
                                        ),
                                        _image == null
                                            ? Container()
                                            : Icon(
                                                Icons.check,
                                                color: Colors.red,
                                              ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.location_on),
                                          border: OutlineInputBorder(),
                                          labelText: 'Address',
                                          hintText:
                                              'Municipality-ward no, district, Nepal '),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.insert_drive_file),
                                        border: OutlineInputBorder(),
                                        labelText: 'Qualification',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.golf_course),
                                        border: OutlineInputBorder(),
                                        labelText: 'Courses',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.5,
                  child: FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text('Apply', style: TextStyle(color: Colors.white)),
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
