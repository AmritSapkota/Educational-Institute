import 'package:flutter/material.dart';

class CommentModel {
  //final UserModel user;
  final String comment, postId;
  final DateTime time;

  const CommentModel({
    this.postId,
    //@required this.user,
    @required this.comment,
    @required this.time,
  });
}
