import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'comment_model.dart';

class PostModel {
  final String id, type, description, imageURL, title;
  final String postTime;
  final int reacts, comment;
  //final UserModel author;
  //final List<CommentModel> comments;

  const PostModel({
    @required this.comment,
    @required this.title,
    @required this.id,
    @required this.type,
    @required this.description,
    // @required this.body,
    @required this.imageURL,
    //@required this.author,
    @required this.postTime,
    @required this.reacts,
    // @required this.views,
    //@required this.comments,
  });

  //String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}
