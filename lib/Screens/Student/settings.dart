import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // ListTile(
            //
            //   leading: ,
            // ),
          ),
          body: Container(
            child: ListView(
              children: [
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
