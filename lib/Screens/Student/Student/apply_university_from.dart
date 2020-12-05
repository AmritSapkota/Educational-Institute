import 'dart:io';
import 'package:educational_institute/Screens/StudentScreen.dart';
import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/models/applied_university_form_model.dart';
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
  //form values
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _qualificaiton = TextEditingController();
  TextEditingController _courses = TextEditingController();

  DateTime dob;
  changeDob(newValue) {
    setState(() {
      dob = newValue;
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

  submitForm(BuildContext context) async {
    AppliedFormModel form = AppliedFormModel(
      firstName: _fname.text,
      lastName: _lname.text,
      email: _email.text,
      phoneNo: _phoneNo.text,
      gender: _selectedGender,
      dob: dob,
      address: _address.text,
      qualification: _qualificaiton.text,
      courses: _courses.text,
      universityName: '',
    );
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Center(child: CircularProgressIndicator()),
          );
        });
    DatabaseService().applyFormToDatabase(form).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => StudentScreen()));
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
            );
          });
    });
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
                                          controller: _fname,
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
                                          controller: _lname,
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
                                      controller: _email,
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
                                      controller: _phoneNo,
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
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      controller: _address,
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
                                      controller: _qualificaiton,
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
                                      controller: _courses,
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
                      if (_formKey.currentState.validate()) {
                        submitForm(context);
                      }
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
