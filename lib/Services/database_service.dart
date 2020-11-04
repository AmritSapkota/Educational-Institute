import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('posts');
  Future upadatePost(PostModel post) async {
    return await ref.doc(uid).set({
      'description': post.description,
      'id': uid,
      'imageURL': post.imageURL,
      'postTime': post.postTime,
      'postType': post.type,
      'reacts': post.reacts,
      'title': post.title,
      'comment': post.comment,
    });
  }

  increaseReact(String id) {
    ref.doc('id').update({'react': FieldValue.increment(1)});
  }
}
