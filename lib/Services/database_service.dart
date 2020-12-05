import 'dart:io';
import 'package:educational_institute/models/applied_university_form_model.dart';
import 'package:educational_institute/models/booked_class_form_model.dart';
import 'package:educational_institute/models/employee_model.dart';
import 'package:educational_institute/models/seminar_model.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  //this instance will be used to fetch data from the firebase
  FirebaseFirestore cloudRef = FirebaseFirestore.instance;
  FirebaseStorage storageRef = FirebaseStorage.instance;

  Future<void> postToDatabase(PostModel post) async {
    try {
      await cloudRef.collection('posts').doc().set(post.toJason());
      return;
    } on Exception catch (e) {
      print("failed to add data to firestore with e: $e");
    }
  }

  Future<void> employeeToDatabase(EmployeeModel employee) async {
    try {
      await cloudRef.collection('employee').doc().set(employee.toJason());
      return;
    } on Exception catch (e) {
      print("failed to add data to firestore with e: $e");
    }
  }

  Future<void> seminarToDatabase(SeminarModel seminar) async {
    try {
      await cloudRef.collection('seminars').doc().set(seminar.toJason());
      return;
    } on Exception catch (e) {
      print("failed to add data to firestore with e: $e");
    }
  }

  Future<void> applyFormToDatabase(AppliedFormModel form) async {
    try {
      await cloudRef.collection('appliedForm').doc().set(form.toJason());
      return;
    } on Exception catch (e) {
      print("failed to add data to firestore with e: $e");
    }
  }

  Future<void> bookClassFormToDatabase(BookedFormModel form) async {
    try {
      await cloudRef.collection('bookedClasses').doc().set(form.toJason());
      return;
    } on Exception catch (e) {
      print("failed to add data to firestore with e: $e");
    }
  }

  Future<String> imageToStorage(File image) async {
    //getting path of the file
    String filePath = basename(image.path);

    //uploading on firestore
    TaskSnapshot taskSnapshot =
        await storageRef.ref().child('postImage/$filePath').putFile(image);

    //getting url and returning it
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  increaseReact(String id) {
    cloudRef.doc('post/$id').update({'reacts': FieldValue.increment(1)});
  }
}
