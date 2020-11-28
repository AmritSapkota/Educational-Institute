import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ChangeProfile extends StatefulWidget {
  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double _heigth = size.height * 0.3;
    double _width = size.width * 0.99;
    double _fontSize = size.height * 0.03;
    double _padding = size.height * 0.03;

    TextEditingController _currPass = TextEditingController();
    TextEditingController _newPass = TextEditingController();
    TextEditingController _conNewPass = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Manage Profile'),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: _padding),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                      Text(
                        "Change Password",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                    ]),
                    TextField(
                      controller: _currPass,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        labelText: 'Current Password',
                      ),
                    ),
                    TextField(
                      controller: _newPass,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _conNewPass,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        labelText: 'Confirm New Password',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          left: size.width * 0.1,
                          right: size.width * 0.1),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.blue,
                        onPressed: () {
                          if (_newPass.text != _conNewPass.text) {}
                          _currPass.clear();
                          _conNewPass.clear();
                          _newPass.clear();
                        },
                        child: AutoSizeText(
                          'Change Password',
                          style: TextStyle(
                            fontSize: _fontSize,
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
      ),
    );
  }
}
