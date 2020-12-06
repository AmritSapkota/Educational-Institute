import 'package:educational_institute/Services/current_date_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DialogServices {
  showConfirmDialog(
      {BuildContext context, String confirmMessage, Function onContinue}) {
    showDialog(
        useRootNavigator: false,
        context: context,
        builder: (context) {
          Widget cancelButton = FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          );
          Widget continueButton = FlatButton(
            child: Text("Continue"),
            onPressed: () {
              onContinue;
            },
          );
          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Confirmation"),
            content: Text(confirmMessage),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
          return alert;
        });
  }

  showSuccessDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(children: [
            Center(
              child: Text('Success'),
            ),
          ]);
        });
  }

  showLoadingDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Container(
                color: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        });
  }

  showLoaderDialog(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7), child: Text(text)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showSuccessDialogue(BuildContext context, String text) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          Container(margin: EdgeInsets.only(left: 7), child: Text(text)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showCommentDialogue(BuildContext context, Size size) {
    TextEditingController _controller;
    userComment(size) {
      return Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.03),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                  style: BorderStyle.solid, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "this is your comment",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                CurrentDateTime().getCurrentDateTime(),
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: size.height * 0.6,
            constraints: BoxConstraints(
              maxWidth: size.width,
              maxHeight: size.height,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.4,
                    //color: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          userComment(size),
                          userComment(size),
                          userComment(size),
                          userComment(size),
                          userComment(size),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.03),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controller,
                          validator: (value) {
                            if (value == null) return "Field can't be empty!";
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            labelText: 'Comment',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  //for rounded border
                                  borderRadius:
                                      BorderRadius.circular(size.height * 0.02),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Post',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: size.width * 0.03),
                            FlatButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  //for rounded border
                                  borderRadius:
                                      BorderRadius.circular(size.height * 0.02),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
