import 'package:flutter/cupertino.dart';

class EmployeeModel {
  String eId, email, firstName, lastName, address, phoneNumber, imageURL;

  DateTime createdAt;

  EmployeeModel({
    @required this.email,
    @required this.eId,
    @required this.firstName,
    @required this.lastName,
    @required this.address,
    @required this.phoneNumber,
    @required this.imageURL,
    @required this.createdAt,
  });
  Map<String, dynamic> toJason() {
    return {
      'eId': eId,
      'email': email,
      'fName': firstName,
      'lName': lastName,
      'address': address,
      'phoneNo': phoneNumber,
      'imageURL': imageURL,
      'createdAt': createdAt,
    };
  }

  EmployeeModel.fromJason(Map<String, dynamic> employee) {
    eId = employee['eId'];
    email = employee['email'];
    firstName = employee['fName'];
    lastName = employee['lName'];
    address = employee['address'];
    phoneNumber = employee['phoneNo'];
    imageURL = employee['imageURL'];
    createdAt = employee['createdAt'];
  }
}
