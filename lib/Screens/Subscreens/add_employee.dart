import 'dart:core';
import 'dart:io';
import 'package:educational_institute/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool showPassword = false;
  File _profilePicture;
  getImage() async {
    PickedFile pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profilePicture = File(pickedImage.path);
      });
    } else {
      print('file not picked');
    }
  }

  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmedPassword = TextEditingController();

//validators for textfields
  String _textFieldValidator(value) {
    if (value.isEmpty) {
      return 'required field';
    }
    return null;
  }

  String _passwordValidator(value) {
    if (value.length < 6) {
      return 'password must be at least 6 characters';
    }
    return null;
  }

  String _confirmPasswordValidator(value) {
    if (value != _password.text) {
      return 'password does not match';
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

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.blue,
                        child: _profilePicture != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _profilePicture,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              ),
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
                              onPressed: () {
                                getImage();
                              },
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
                  child: TextFormField(
                    style: textStyle,
                    controller: _fName,
                    validator: _textFieldValidator,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'First Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: _lName,
                    validator: _textFieldValidator,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Last Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: _email,
                    validator: _emailValidator,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: _address,
                    validator: _textFieldValidator,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: _phoneNo,
                    validator: _textFieldValidator,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Mobile Number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: _password,
                    validator: _passwordValidator,

                    // enableInteractiveSelection: false,
                    // onTap: () {
                    //   FocusScope.of(context).requestFocus(new FocusNode());
                    // },
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    style: textStyle,
                    controller: _confirmedPassword,
                    validator: _confirmPasswordValidator,
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
                      labelText: 'Confirm Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.025)),
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
                        if (_formKey.currentState.validate()) {}
                      },
                      color: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.025)),
                      child: Text(
                        "Create Employee",
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
      ),
    );
  }
}
