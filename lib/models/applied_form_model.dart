
import 'package:flutter/material.dart';

class AppliedFormModel {
  String firstName,
      lastName,
      email,
      phoneNo,
      gender,
      imageURL,
      address,
      qualification,
      courses;
  DateTime dob;

  AppliedFormModel({
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
  }

  Map<String, dynamic> toJason(AppliedFormModel form) {
    return {
      'firstName': form.firstName,
      'lastName': form.lastName,
      'email': form.email,
      'phoneNo': form.phoneNo,
      'gender': form.gender,
      'imageURL': form.imageURL,
      'address': form.address,
      'qualification': form.qualification,
      'courses': form.courses,
      'dob': form.dob,
    };
  }
}