import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/models/post_model.dart';

class DatabaseService {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('posts');
  Future upadatePost(PostModel post) async {
    return await ref.doc().set({
      'description': post.description,
      'imageURL': post.imageURL,
      'postTime': post.postTime,
      'postType': post.type,
      'reacts': post.reacts,
      'title': post.title,
      'comment': post.comment,
    });
  }

  increaseReact(String id) {
    ref.doc('post/' + id).update({'react': FieldValue.increment(1)});
  }
}
