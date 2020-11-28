import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class PostModel {
  //keeping it final means we cannot set this parameters once initialized
  String postType, description, imageURL, title;
  String postTime;
  int reacts, commentId;
   String postId;
  //final UserModel author;
  //final List<CommentModel> comments;

  PostModel({
    @required this.postId,
    @required this.commentId,
    @required this.title,
    @required this.postType,
    @required this.description,
    // @required this.body,
    @required this.imageURL,
    //@required this.auth or,
    @required this.postTime,
    @required this.reacts,
    // @required this.views,
    //@required this.comments,
  });
  Map<String, dynamic> toJason() {
    return {
      'description': description,
      'imageURL': imageURL,
      'postTime': postTime,
      'postType': postType,
      'reacts': reacts,
      'title': title,
      'commentId': commentId,
    };
  }

  PostModel.fromJason(Map<String, dynamic> post) {
    description = post['description'];
    imageURL = post['imageURL'];
    postTime = post['postTime'];
    postType = post['postType'];
    reacts = post['reacts'];
    title = post['title'];
    commentId = post['commentId'];
  }
  //String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}
