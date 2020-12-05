import 'dart:core';

import 'package:flutter/material.dart';

class SeminarModel {
  String description, link, location, eId, title;
  DateTime date;

  SeminarModel({
    @required this.description,
    @required this.link,
    @required this.location,
    @required this.eId,
    @required this.date,
    @required this.title,
  });

  Map<String, dynamic> toJason() {
    return {
      'description': description,
      'link': link,
      'location': location,
      'eId': eId,
      'date': date,
      'title': title,
    };
  }

  SeminarModel.fromJason(Map<String, dynamic> seminar) {
    description = seminar['description'];
    link = seminar['link'];
    location = seminar['location'];
    eId = seminar['eId'];
    date = seminar['date'].toDate();
    title = seminar['title'];
  }
}
