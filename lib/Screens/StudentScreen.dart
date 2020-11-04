import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/Screens/Student/Drawer/about_us.dart';
import 'package:educational_institute/Screens/Student/Drawer/language_course.dart';
import 'package:educational_institute/Screens/Student/Drawer/serach%20university.dart';
import 'package:educational_institute/Screens/Student/Drawer/settings.dart';
import 'package:educational_institute/Screens/lib/colors.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:educational_institute/widgets/my_drawer.dart';
import 'package:educational_institute/widgets/my_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.school,
                size: size.height * 0.03 * size.width * 0.004,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Text(
                  'Educational Institute',
                  style: TextStyle(
                    fontSize: size.height * 0.01 * size.width * 0.004,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('Loading...'),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something Went Wrong!!'),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot post = snapshot.data.documents[index];
                  return MyPost(
                    post: PostModel(
                      type: post['postType'],
                      description: post['description'],
                      postTime: post['postTime'],
                      id: post['id'],
                      imageURL: post['imageURL'],
                      comment: post['comment'],
                      title: post['title'],
                      reacts: post['reacts'],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
