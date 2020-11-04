import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final pid;
  DatabaseService({this.pid});
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('posts');
  Future upadatePost(PostModel post) async {
    return await ref.doc(pid).set({
      'description': post.description,
      'id': post.id,
      'imageURL': post.imageURL,
      'postTime': post.postTime,
      'postType': post.type,
      'reacts': post.reacts,
      'title': post.title,
    });
  }

  increaseReact(String id) {
    ref.doc('id').update({'react': FieldValue.increment(1)});
  }
}
