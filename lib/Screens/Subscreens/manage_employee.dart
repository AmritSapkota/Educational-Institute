import 'package:educational_institute/Services/show_dialogue.dart';
import 'package:flutter/material.dart';

class ManageEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Employee'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          EmployeeAsList(),
        ],
      ),
    );
  }
}

class EmployeeAsList extends StatelessWidget {
  _deleteUser() {}

  String _imageURL =
      'https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      trailing: IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.blue,
        ),
        onPressed: () {
          DialogServices().showConfirmDialog(
              context: context,
              confirmMessage: 'Do you want to delete this user?',
              onContinue: _deleteUser);
        },
      ),
      contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      leading: Container(
        width: size.width * 0.2,
        height: size.height * 0.2,
        decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.blue[50]),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 10))
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: NetworkImage(
                  _imageURL,
                ))),
      ),
      title: Text(
        'Amrit Sharma',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
