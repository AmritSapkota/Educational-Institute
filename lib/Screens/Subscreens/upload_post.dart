import 'package:educational_institute/Screens/lib/colors.dart';
import 'package:flutter/material.dart';

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  String _profileName = "Educational Institute";
  String dropdownValue = 'University';
  TextEditingController _description = TextEditingController();

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
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        'Select Post Type  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      DropdownButton(
                        value: dropdownValue,
                        items: <String>['University', 'Seminar', 'Language']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          'What sort of post you want to upload',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        onTap: () {},
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    child: TextField(
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
                      onPressed: () {},
                      textTheme: ButtonTextTheme.accent,
                      child: Icon(
                        Icons.photo_album,
                      ),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      color: PrimaryColor,
                      onPressed: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
