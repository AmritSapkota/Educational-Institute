import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class PostModel {
  //keeping it final means we cannot set this parameters once initialized
  String postType, description, imageURL, country, university;
  String postTime;
  int reacts, commentId;
  String postId;
  String eId;

  //final UserModel author;
  //final List<CommentModel> comments;

  PostModel({
    @required this.postId,
    @required this.commentId,
    @required this.country,
    @required this.university,
    @required this.postType,
    @required this.description,
    // @required this.body,
    @required this.imageURL,
    //@required this.auth or,
    @required this.postTime,
    @required this.reacts,
    @required this.eId,
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
      'country': country,
      'commentId': commentId,
      'eId': eId,
      'university': university,
    };
  }

  PostModel.fromJason(Map<String, dynamic> post) {
    description = post['description'];
    imageURL = post['imageURL'];
    postTime = post['postTime'];
    postType = post['postType'];
    reacts = post['reacts'];
    university = post['university'];
    country = post['country'];
    commentId = post['commentId'];
    eId = post['eId'];
  }
  //String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}
