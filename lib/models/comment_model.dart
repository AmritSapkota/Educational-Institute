import 'package:flutter/material.dart';

class CommentModel {
  //final UserModel user;
  final String comment, postId, uId;
  final DateTime time;

  const CommentModel({
    @required this.uId,
    @required this.postId,
    //@required this.user,
    @required this.comment,
    @required this.time,
  });
}
