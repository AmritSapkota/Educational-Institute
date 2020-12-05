import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_institute/models/applied_university_form_model.dart';
import 'package:educational_institute/models/booked_class_form_model.dart';
import 'package:educational_institute/widgets/student_in_card_view.dart';
import 'package:flutter/material.dart';

class StudentInfo extends StatefulWidget {
  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  int _currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    AppliedToUniversity(),
    BookedLanguageCourse(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('Applied To University'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Booked Language Classes',
                  //maxLines: 3,
                ),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.blue,
          ),
          appBar: AppBar(
            title: Text('Student Information'),
          ),
          body: _widgetOptions.elementAt(_currentIndex),
        ),
      ),
    );
  }
}

class AppliedToUniversity extends StatelessWidget {
  AppliedFormModel uniStudent = AppliedFormModel(
      firstName: 'Amrit',
      lastName: 'Sharma',
      dob: DateTime.now(),
      courses: 'Computer Science',
      qualification: 'Bachelors of Computer Science',
      address: 'Kawasoti -6, Nawalparasi, Nepal',
      email: 'sharma.amrit114@gmail.com',
      gender: 'male',
      phoneNo: '+9779847072106',
      universityName: 'Sejong University');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('appliedForm').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (snapshot.hasError)
            return Center(
              child: Text('Something went wrong'),
            );
          else {
            if (snapshot.data.documents.length > 0)
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot seminar = snapshot.data.documents[index];
                    AppliedFormModel form =
                        AppliedFormModel.fromJason(seminar.data());
                    return StudentInCardView(
                      uniStudent: form,
                    );
                  });
            else {
              return Center(
                child: Text('No Students Applied To University Yet!'),
              );
            }
          }
        });
  }
}

class BookedLanguageCourse extends StatefulWidget {
  @override
  _BookedLanguageCourseState createState() => _BookedLanguageCourseState();
}

class _BookedLanguageCourseState extends State<BookedLanguageCourse> {
  // BookedFormModel langStudent = BookedFormModel(
  //   firstName: 'Amrit',
  //   lastName: 'Sharma',
  //   choosedClass: 'IELTS',
  //   gender: 'male',
  //   phoneNo: '+9779847072106',
  //   email: 'sharma.amrit114@gmail.com',
  //   shift: 'morning',
  //   paymentOption: 'e-sewa',
  //   receiptURL:
  //       'https://firebasestorage.googleapis.com/v0/b/educational-institute-ca530.appspot.com/o/postImage%2Fimage_picker7684379982938842217.jpg?alt=media&token=eabaf719-9461-452d-a5d1-ef2389cf8591',
  //   estimatedStartingDate: DateTime.now(),
  // );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('bookedClasses').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (snapshot.hasError)
            return Center(
              child: Text('Something went wrong'),
            );
          else {
            if (snapshot.data.documents.length > 0)
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot seminar = snapshot.data.documents[index];
                    BookedFormModel form =
                        BookedFormModel.fromJason(seminar.data());
                    return StudentInCardView(
                      langStudent: form,
                    );
                  });
            else {
              return Center(
                child: Text('No Students Booked Classes Yet!'),
              );
            }
          }
        });
  }
}
