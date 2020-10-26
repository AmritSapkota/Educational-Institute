import 'package:educational_institute/Screens/lib/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  Padding _post(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.height * size.width * 0.00006),
      child: Container(
        //if we use boxdecor we cannot use color property outside boxdecor
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05)),
        ),
        constraints: BoxConstraints(
          minHeight: size.height * 0.3,
          minWidth: size.width,
        ),
        child: Center(
          child: Text('Post Comming Soon...'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(children: <Widget>[
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(''),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('University Search'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language Courses'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
            ListTile(
              leading: Icon(Icons.merge_type),
              title: Text('Seminars'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(''
                  'Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
          ]),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.school,
                size: size.height * 0.03 * size.width * 0.004,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Text(
                  'Educational Institute',
                  style: TextStyle(
                    fontSize: size.height * 0.01 * size.width * 0.004,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: size.height,
              maxHeight: double.infinity,
              minWidth: size.width,
              maxWidth: size.width,
            ),
            decoration: BoxDecoration(
              color: PrimaryColor[300],
            ),
            child: Column(
              children: [
                _post(size),
                _post(size),
                _post(size),
                _post(size),
                _post(size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
