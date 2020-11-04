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

//list that stores all the posts from the institute
List<PostModel> posts = [];
//TODO: make post list updated with all the posts we have in the app
//method to get post from firestore

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: size.height,
              maxHeight: double.infinity,
              minWidth: size.width,
              maxWidth: size.width,
            ),
            decoration: BoxDecoration(
              color: PrimaryColor[300],
            ),
            child: Column(
              children: [
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection('posts')
                //       .snapshots(),
                //   builder: (_, snapshot) {
                //     if (!snapshot.hasData) {
                //       return Center(
                //         child: Text('Loading...'),
                //       );
                //     } else if (snapshot.hasError) {
                //       return Center(
                //         child: Text('Something Went Wrong!!'),
                //       );
                //     } else {
                //       return ListView.builder(
                //         itemCount: snapshot.data.documents.length,
                //         itemBuilder: (_, index) {
                //           return MyPost(
                //             post: PostModel(
                //               type: snapshot.data.documents[index].data['type'],
                //               description: snapshot
                //                   .data.documents[index].data['description'],
                //               postTime: snapshot
                //                   .data.documents[index].data['postTime'],
                //               id: snapshot.data.documents[index].data['id'],
                //               imageURL: snapshot
                //                   .data.documents[index].data['imageURL'],
                //               comment: snapshot
                //                   .data.documents[index].data['comment'],
                //               title:
                //                   snapshot.data.documents[index].data['title'],
                //               reacts:
                //                   snapshot.data.documents[index].data['reacts'],
                //             ),
                //           );
                //         },
                //       );
                //     }
                //   },
                // ),
                // Provider<MyPost>(
                //   create: (_) => MyPost(
                //     posts: PostModel(
                //       type: 'Language',
                //       description:
                //           'testing this app what you can do to help you get the 3rd of your time to be able to get a full time worker to get a job in the world of your home so you can get a free download of the letter from the library of the 3 and 2AM and you will 6AM said to be the only one in this pandemic who had a lot more than a few hundred',
                //       postTime: '2020-10-10',
                //       id: 'H4jGwnuNbJxOllVF81Hm',
                //       imageURL:
                //           'https://firebasestorage.googleapis.com/v0/b/educational-institute-ca530.appspot.com/o/posts%2Fimage_picker881231912493333317.jpg%7D?alt=media&token=c5ef44da-05ef-46b4-9d5c-06c47edb143a',
                //       comment: 0,
                //       title: 'testing',
                //       reacts: 0,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
