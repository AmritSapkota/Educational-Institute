import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/Services/readmore_text.dart';
import 'package:educational_institute/models/post_model.dart';
import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  PostModel post;
  CollectionReference reference;
  MyPost({@required this.post, @required this.reference});
  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  getImage(String imageURL) {
    if (imageURL != null)
      return Image.network(
        imageURL,
        fit: BoxFit.cover,
      );
    else
      return null;
  }

  bool _liked = false;
  like() {
    setState(() {
      if (_liked == true)
        widget.post.reacts++;
      else
        widget.post.reacts--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height * size.width * 0.00006),
      child: Container(
        padding: EdgeInsets.all(size.height * 0.01),
        //if we use boxdecor we cannot use color property outside boxdecor
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05)),
        ),
        constraints: BoxConstraints(
          minHeight: size.height * 0.3,
          minWidth: size.width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Icon(Icons.school)),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text('Educational Institute'),
                Spacer(),
                Text(
                  widget.post.postTime,
                )
              ],
            ),
            SizedBox(
              height: size.width * 0.03,
            ),
            ReadMoreText(
              widget.post.description,
              trimLines: 2,
              colorClickableText: Colors.blueAccent,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Show more',
              trimExpandedText: ' show less',
            ),
            SizedBox(
              height: size.width * 0.03,
            ),
            widget.post.imageURL == ''
                ? Container()
                : Container(
                    height: size.height * 0.3,
                    width: size.width,
                    child: getImage(widget.post.imageURL),
                  ),
            SizedBox(
              height: size.width * 0.03,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        size: size.width * 0.05,
                        color: !_liked ? Colors.grey : Colors.blue,
                      ),
                      onPressed: () {
                        _liked = !_liked;
                        like();
                      },
                    ),
                    Text(widget.post.reacts.toString()),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                    ),
                    Text(widget.post.comment.toString()),
                  ],
                ),
                Spacer(),
                RaisedButton(
                  color: Colors.white,
                  //padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Apply Now"),
                      Icon(
                        Icons.arrow_forward,
                        size: size.height * 0.02,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
