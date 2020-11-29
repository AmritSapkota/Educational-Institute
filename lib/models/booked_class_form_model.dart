import 'package:flutter/material.dart';

class BookedFormModel {
  String firstName,
      lastName,
      email,
      phoneNo,
      gender,
      choosedClass,
      shift,
      paymentOption,
      receiptURL;
  DateTime estimatedStartingDate;

  BookedFormModel({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.shift,
    @required this.choosedClass,
    @required this.estimatedStartingDate,
    @required this.gender,
    @required this.phoneNo,
    @required this.paymentOption,
    @required this.receiptURL,
  });

  BookedFormModel.fromJason(Map<String, dynamic> languageStudent) {
    firstName = languageStudent['firstName'];
    lastName = languageStudent['lastName'];
    email = languageStudent['email'];
    shift = languageStudent['shift'];
    choosedClass = languageStudent['choosedClass'];
    estimatedStartingDate = languageStudent['estimatedStartingDate'];
    gender = languageStudent['gender'];
    phoneNo = languageStudent['phoneNo'];
    paymentOption = languageStudent['paymentOption'];
    receiptURL = languageStudent['receiptURL'];
  }

  Map<String, dynamic> toJason() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'shift': shift,
      'choosedClass': choosedClass,
      'estimatedStartingDate': estimatedStartingDate,
      'gender': gender,
      'phoneNo': phoneNo,
      'paymentOption': paymentOption,
      'receiptURL': receiptURL,
    };
  }
}
