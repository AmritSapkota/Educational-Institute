import 'package:educational_institute/Screens/lib/colors.dart';
import 'package:educational_institute/Services/current_date_time.dart';
import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/Services/shared_pref.dart';
import 'package:educational_institute/Services/show_dialogue.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

//TODO: validator
class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  GlobalKey<FormState> _formKey = GlobalKey();
  File _image;
  var _uploadedFileURL = '';
  String dropdownValue = 'University';
  TextEditingController _description = TextEditingController();
  TextEditingController _university = TextEditingController();
  TextEditingController _country = TextEditingController();

  //pick image
  Future chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      //state is calledback cause we need to show image on the display
      setState(() {
        _image = File(image.path);
      });
    });
  }

  onUpload() async {
    await uploadFile();
  }

  //to upload photo on fireStore
  Future uploadFile() async {
    //uploading image if selected
    DialogServices().showLoaderDialog(context, 'Uploading...');
    if (_image != null) {
      String fileURL = await DatabaseService().imageToStorage(_image);
      setState(() {
        _uploadedFileURL = fileURL;
      });
    }
    String userId;
    SharedPrefService().getFromSharedPref(key: 'userId').then((value) {
      userId = value;
    });
    //uploading post
    PostModel post = PostModel(
      postId: '',
      eId: userId,
      country: _country.text,
      university: _university.text,
      description: _description.text,
      imageURL: _uploadedFileURL,
      reacts: 0,
      commentId: 0,
      postTime: CurrentDateTime().getCurrentDateTime(),
      postType: dropdownValue,
    );
    print(post);
    DatabaseService().postToDatabase(post).then((value) => showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Center(child: Text('Successfully Uploaded Post')),
            ],
          );
        }));
    Navigator.pop(context);
    clearSelection();
  }

  clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = '';
      _description.clear();
      _country.clear();
      _university.clear();
    });
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
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Add Post'),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _country,
                        decoration: InputDecoration(
                          labelText: 'Country',
                          hintText: 'Enter Country Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      TextFormField(
                        controller: _university,
                        decoration: InputDecoration(
                          labelText: 'University',
                          hintText: 'Enter University Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      _image != null
                          ? Container(
                              padding: EdgeInsets.only(top: size.height * 0.02),
                              child: Image.file(
                                _image,
                                height: size.height * 0.3,
                              ),
                            )
                          : Container(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
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
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
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
                                            await onUpload();
                                          },
                                        );
                                        // set up the AlertDialog
                                        AlertDialog alert = AlertDialog(
                                          title: Text("Confirm Post"),
                                          content: Text(
                                              "Would you like to save changes to profile?"),
                                          actions: [
                                            cancelButton,
                                            continueButton,
                                          ],
                                        );
                                        return alert;
                                      });
                                }
                              },
                              textTheme: ButtonTextTheme.accent,
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
