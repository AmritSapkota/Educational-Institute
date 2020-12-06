import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:educational_institute/widgets/my_drawer.dart';
import 'package:educational_institute/widgets/my_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:kommunicate_flutter_plugin/kommunicate_flutter_plugin.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  TextEditingController _search = TextEditingController();
  Future<List> _posts;

  bool isSearching = false;
  Stream _notSearchingStream = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('postTime', descending: true)
      .snapshots();

  //getting post
  getPost() {}
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          onPressed: () async {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => ChatService()));
            try {
              dynamic conversationObject = {
                'appId': '37033499ddb723b1327e8aa59080773b8',
                //'withPreChat': true,
              };
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: new Row(
                          children: [
                            CircularProgressIndicator(),
                            Container(
                                margin: EdgeInsets.only(left: 7),
                                child: Text("Loading... Please Wait!")),
                          ],
                        ),
                      ));
              dynamic result = await KommunicateFlutterPlugin.buildConversation(
                  conversationObject);
              Navigator.pop(context);
              print("Conversation builder success : " + result.toString());
            } on Exception catch (e) {
              print("Conversation builder error occurred : " + e.toString());
            }
          },
        ),
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
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Text(
                  'Educational Institute',
                  style: TextStyle(
                    fontSize: size.height * 0.01 * size.width * 0.004,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            isSearching
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.05),
                    child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _search.text = value;
                          });
                        },
                        controller: _search,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.white,
                            onPressed: () => _search.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          labelText: "Search for university ...",
                          labelStyle: TextStyle(
                            color: CupertinoColors.white,
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        )),
                  )
                : Container(),
            Flexible(
              child: StreamBuilder(
                stream: _notSearchingStream,
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
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
                        print(post.toString());
                        if (isSearching) {
                          if (post['university']
                              .toLowerCase()
                              .contains(_search.text.toLowerCase())) {
                            return MyPost(
                              post: PostModel(
                                postId: post.id,
                                postType: post['postType'],
                                description: post['description'],
                                postTime: post['postTime'],
                                imageURL: post['imageURL'],
                                commentId: post['commentId'],
                                country: post['country'],
                                university: post['university'],
                                eId: post['eId'],
                                reacts: post['reacts'],
                              ),
                            );
                          } else
                            return Container();
                        } else {
                          return MyPost(
                            post: PostModel(
                              postId: post.id,
                              postType: post['postType'],
                              description: post['description'],
                              postTime: post['postTime'],
                              imageURL: post['imageURL'],
                              commentId: post['commentId'],
                              country: post['country'],
                              university: post['university'],
                              eId: post['eId'],
                              reacts: post['reacts'],
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
