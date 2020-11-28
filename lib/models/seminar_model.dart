import 'dart:core';

import 'package:flutter/material.dart';

class SeminarModel {
  String description, link, location, eId;
  DateTime date;

  SeminarModel({
  @required this.description,
  @required this.link,
  @required this.location,
  @required this.eId,
  @required this.date,
});

  Map<String, dynamic> toJason(SeminarModel seminar) {
    return {
      'description': seminar.description,
      'link': seminar.link,
      'location': seminar.location,
      'eId': seminar.eId,
      'date': seminar.date,
    };
  }

  SeminarModel.fromJason(Map<String, dynamic> seminar) {
    description = seminar['description'];
    link = seminar['link'];
    location = seminar['location'];
    eId = seminar['eId'];
    date = seminar['date'];
  }
}
