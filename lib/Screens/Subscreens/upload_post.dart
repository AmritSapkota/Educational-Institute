import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/Screens/lib/colors.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/current_date_time.dart';
import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

//snackbar showing upload post
//bool showUploadedSnackbar = false;
//this function shows snackbar if called in widgets inside scaffold
// void showInSnackBar(String value) {
//   scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
// }

GlobalKey<FormState> _formKey = GlobalKey();
bool autoValidate = false;
// image file
File _image;
String _uploadedFileURL;
String _profileName = "Educational Institute";
String dropdownValue = 'University';
TextEditingController _description = TextEditingController();
TextEditingController _title = TextEditingController();
//for displaying snackbar
final _scaffoldKey = GlobalKey<ScaffoldState>();

class _UploadPostState extends State<UploadPost> {
  //pick image
  Future chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = File(image.path);
      });
    });
  }

  //to upload photo on fireStore
  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    /*
    alternative process is:
    String fileName = basename(_image.path);
    StorageReference storageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTAsk = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    */

    taskSnapshot.ref.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = null;
      dropdownValue = 'University';
      _description.clear();
      _title.clear();
      autoValidate = false;
    });
  }

  Builder UploadButton() {
    return Builder(
      builder: (ctx) => RaisedButton(
        color: PrimaryColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _image != null ? uploadFile() : null;
            PostModel post = PostModel(
              title: _title.text,
              description: _description.text,
              id: uid,
              imageURL: _uploadedFileURL,
              reacts: 0,
              comment: 0,
              postTime: CurrentDateTime().getCurrentDateTime(),
              type: dropdownValue,
            );
            DatabaseService().upadatePost(post);
            clearSelection();
          }
        },
        child: Text(
          'Upload',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: size.height * 0.1,
                        ),
                        Text(
                          _profileName,
                        )
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      width: size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Spacer(),
                          Text(
                            'Select Post Type  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),

                          DropdownButton(
                            value: dropdownValue,
                            items: <String>['University', 'Seminar', 'Language']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _title,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            labelText: 'title',
                          ),
                        )),
                    _image != null
                        ? Image.file(
                            _image,
                            height: size.height * 0.3,
                          )
                        : Container(),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text('Description'),
                    Container(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, right: size.width * 0.05),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _description,
                        //keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: 10,
                        autofocus: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "Whats in your mind...",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          chooseFile();
                        },
                        textTheme: ButtonTextTheme.accent,
                        child: Icon(
                          Icons.photo_album,
                        ),
                      ),
                    ),
                    Center(
                      child: UploadButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
