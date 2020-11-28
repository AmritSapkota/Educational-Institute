import 'package:flutter/material.dart';

class LanguageStudentModel {
  String firstName,
      lastName,
      email,
      mobileNumber,
      gender,
      choosedClass,
      shift,
      paymentOption,
      receiptURL;
  DateTime estimatedStartingDate;

  LanguageStudentModel({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.shift,
    @required this.choosedClass,
    @required this.estimatedStartingDate,
    @required this.gender,
    @required this.mobileNumber,
    @required this.paymentOption,
    @required this.receiptURL,
  });

  LanguageStudentModel.fromJason(Map<String, dynamic> languageStudent) {
    firstName = languageStudent['firstName'];
    lastName = languageStudent['lastName'];
    email = languageStudent['email'];
    shift = languageStudent['shift'];
    choosedClass = languageStudent['choosedClass'];
    estimatedStartingDate = languageStudent['estimatedStartingDate'];
    gender = languageStudent['gender'];
    mobileNumber = languageStudent['mobileNumber'];
    paymentOption = languageStudent['paymentOption'];
    receiptURL = languageStudent['receiptURL'];
  }

  Map<String, dynamic> toJason(LanguageStudentModel student) {
    return {
      'firstName': student.firstName,
      'lastName': student.lastName,
      'email': student.email,
      'shift': student.shift,
      'choosedClass': student.choosedClass,
      'estimatedStartingDate': student.estimatedStartingDate,
      'gender': student.gender,
      'mobileNumber': student.mobileNumber,
      'paymentOption': student.paymentOption,
      'receiptURL': student.receiptURL,
    };
  }
}
