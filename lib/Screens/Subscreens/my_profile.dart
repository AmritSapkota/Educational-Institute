import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/Services/shared_pref.dart';
import 'package:educational_institute/models/employee_model.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userId;

  _UserProfileState() {
    SharedPrefService().getFromSharedPref(key: 'userId').then((value) {
      setState(() {
        userId = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      //TODO: change User id to current user Id
      future: FirebaseFirestore.instance
          .collection('Employee')
          .doc('QSzJfg4fafxqth1jaaWN')
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          EmployeeModel user = EmployeeModel.fromJason(snapshot.data.data());
          return MyProfile(
            employee: user,
          );
        }
      },
    );
  }
}

class MyProfile extends StatefulWidget {
  EmployeeModel employee;
  MyProfile({@required this.employee});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  showDialogBox(title, message) {
    showDialog(
      context: context,
      builder: (context) {
        Widget cancelButton = FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        );
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            cancelButton,
          ],
        );
      },
    );
  }

  _updateAccount() {
    //this is synchronous function
    //checking name
    if (_fName.text.isNotEmpty) {
      widget.employee.firstName = _fName.text;
    }
    //checking name
    if (_lName.text.isNotEmpty) {
      widget.employee.lastName = _lName.text;
    }
    //checking address
    if (_address.text.isNotEmpty) {
      widget.employee.address = _address.text;
    }
    //checking phoneNo
    if (_phoneNo.text.isNotEmpty) {
      widget.employee.phoneNumber = _phoneNo.text;
    }
    if (_password.text.isNotEmpty) {
      _changeUserData(changePassword: true);
    } else {
      _changeUserData(changePassword: false);
    }
  }

  _changeUserData({bool changePassword}) async {
    await DatabaseService().updateEmployee(widget.employee).then((value) {
      if (changePassword) {
        AuthServices().changeCurrentUsersPassword(_password.text).then((value) {
          showDialogBox('Success', 'password Updated');
        }).catchError((e) {
          showDialogBox("Error", e.toString());
        });
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyProfile()));
      showDialogBox('Success', 'User updated');
    }).catchError((e) {
      showDialogBox('Error', e.toString());
    });
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.blue,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.blue),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: widget.employee.imageURL != null
                          ? NetworkImage("${widget.employee.imageURL}")
                          : Text(
                              "${widget.employee.firstName[0].toUpperCase()}",
                              style: TextStyle(fontSize: 40.0),
                            ),
                      backgroundColor: Colors.transparent,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.blue,
                            ),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: _fName,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'First Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: _lName,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'last Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  enableInteractiveSelection: false,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  controller: _email,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: _address,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Address',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: _phoneNo,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Mobile Number',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: _password,
                  obscureText: showPassword ? false : true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: showPassword ? Colors.blue : Colors.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '*********',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      //if it still lacks focus unfocus the focus item
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }

                      showDialog(
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
                              onPressed: () async {
                                Navigator.pop(context);
                                await _updateAccount();
                              },
                            );
                            // set up the AlertDialog
                            AlertDialog alert = AlertDialog(
                              title: Text("AlertDialog"),
                              content: Text(
                                  "Would you like to save changes to profile?"),
                              actions: [
                                cancelButton,
                                continueButton,
                              ],
                            );
                            return alert;
                          });
                    },
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
