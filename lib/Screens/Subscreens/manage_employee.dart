import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/show_dialogue.dart';
import 'package:educational_institute/models/employee_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('employee').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                color: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot employee = snapshot.data.documents[index];
                  return EmployeeAsList(
                      employee: EmployeeModel.fromJason(employee.data()));
                },
              );
              ;
            } else {
              return Container(
                child: Center(
                  child: Text('Something went wrong! '),
                ),
              );
            }
          }),
    );
  }
}

class EmployeeAsList extends StatelessWidget {
  EmployeeModel employee;
  EmployeeAsList({@required this.employee});

  _deleteUser(context) {
    print('signin as user');
    AuthServices().singIn(employee.email, employee.password).then((value) {
      print('deleting User from auth');
      FirebaseAuth.instance.currentUser.delete().then((value) {
        print('deleting User from database');
        FirebaseFirestore.instance
            .collection('employee')
            .doc(employee.eId)
            .delete()
            .then((value) {
          print('re authenticating as admin');
          AuthServices().signInAsAdimAfterUserCreation().then((value) {
            print('success');
            Navigator.pop(context);
            DialogServices().showSuccessDialog(context);
          });
        });
      });
    }).catchError((error) {
      print('##############error: $error####################');
      AuthServices().signInAsAdimAfterUserCreation();
      // Fluttertoast.showToast(msg:'failed deleting user');
    });
  }

  String _imageURL =
      'https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250';

  showConfirmationDialog(context, confirmMessage) {
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
            onPressed: () {
              _deleteUser(context);
            },
          );
          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Confirmation"),
            content: Text(confirmMessage),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
          return alert;
        });
  }

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
          showConfirmationDialog(context, 'Do you want to delete this user?');
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
                  employee.imageURL != null ? employee.imageURL : _imageURL,
                ))),
      ),
      title: Text(
        employee.firstName + ' ' + employee.lastName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
