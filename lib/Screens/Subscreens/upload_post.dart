import 'package:educational_institute/Screens/lib/colors.dart';
import 'package:educational_institute/Services/current_date_time.dart';
import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/Services/show_dialogue.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

//to check form state
GlobalKey<FormState> _formKey = GlobalKey();
bool autoValidate = false;
// image file
File _image;
dynamic _uploadedFileURL = '';
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
      //state is calledback cause we need to show image on the display
      setState(() {
        _image = File(image.path);
      });
    });
  }

  //to upload photo on fireStore
  Future uploadFile() async {
    //uploading image if selected
    DialogServices().showLoaderDialog(context, 'Uploading...');
    if (_image != null) {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('posts/${Path.basename(_image.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      var fileURL = await taskSnapshot.ref.getDownloadURL();

      //no need to set state as we dont want to render it on screen
      setState(() {
        _uploadedFileURL = fileURL;
      });
    }
    //uploading post
    PostModel post = PostModel(
      title: _title.text,
      description: _description.text,
      imageURL: _uploadedFileURL,
      reacts: 0,
      comment: 0,
      postTime: CurrentDateTime().getCurrentDateTime(),
      type: dropdownValue,
    );
    print(_uploadedFileURL);
    DatabaseService().upadatePost(post);
    Navigator.pop(context);
    clearSelection();
  }

  clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = '';
      dropdownValue = 'University';
      _description.clear();
      _title.clear();
      autoValidate = false;
    });
  }

  Builder uploadButton() {
    return Builder(
      builder: (
        ctx,
      ) =>
          RaisedButton(
        color: PrimaryColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            uploadFile();
          } else {
            print('invalid form state');
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
                      child: uploadButton(),
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
