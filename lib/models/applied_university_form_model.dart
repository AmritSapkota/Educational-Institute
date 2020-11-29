import 'package:flutter/material.dart';

class AppliedFormModel {
  //TODO: confirm whether receipt or payment needed or not
  String firstName,
      lastName,
      email,
      phoneNo,
      gender,
      imageURL,
      address,
      qualification,
      courses,
      universityName;
  DateTime dob;

  AppliedFormModel({
    @required this.universityName,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phoneNo,
    @required this.gender,
    @required this.imageURL,
    @required this.address,
    @required this.qualification,
    @required this.courses,
    @required this.dob,
  });

  AppliedFormModel.fromJason(Map<String, dynamic> appliedForm) {
    firstName = appliedForm['firstName'];
    lastName = appliedForm['lastName'];
    email = appliedForm['email'];
    phoneNo = appliedForm['phoneNo'];
    gender = appliedForm['gender'];
    imageURL = appliedForm['imageURL'];
    address = appliedForm['address'];
    qualification = appliedForm['qualification'];
    courses = appliedForm['courses'];
    dob = appliedForm['dob'];
    universityName = appliedForm['universityName'];
  }

  Map<String, dynamic> toJason() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNo': phoneNo,
      'gender': gender,
      'imageURL': imageURL,
      'address': address,
      'qualification': qualification,
      'courses': courses,
      'dob': dob,
      'universityName': universityName,
    };
  }
}
