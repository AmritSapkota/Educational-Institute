import 'package:educational_institute/models/applied_university_form_model.dart';
import 'package:educational_institute/models/booked_class_form_model.dart';
import 'package:educational_institute/widgets/my_student_form_for_language.dart';
import 'package:educational_institute/widgets/my_student_form_for_university.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StudentInCardView extends StatelessWidget {
  BookedFormModel langStudent;
  AppliedFormModel uniStudent;
  StudentInCardView({this.langStudent, this.uniStudent})
      : assert(
          (langStudent != null || uniStudent != null),
          'One of the parameters must be provided',
        );
  bool isUniStudent() {
    if (langStudent == null)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.02,
          right: size.width * 0.02),
      child: Card(
        //margin: EdgeInsets.all(size.height),
        elevation: size.height * 0.02,
        //clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            isUniStudent()
                ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyStudentFormForUniversity(student: uniStudent);
                  }))
                : Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyStudentFormForLanguage(student: langStudent);
                  }));
          },
          child: Row(
            children: [
              CircleAvatar(
                child: Text(isUniStudent()
                    ? '${uniStudent.firstName[0].toUpperCase()}'
                    : '${langStudent.firstName[0].toUpperCase()}'),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      isUniStudent()
                          ? '${uniStudent.firstName} ${uniStudent.lastName}'
                          : '${langStudent.firstName} ${langStudent.lastName}',
                      style: TextStyle(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(isUniStudent()
                                ? '${uniStudent.universityName}'
                                : '${langStudent.choosedClass}'
                            //style: TextStyle(fontSize: size.height * 0.03),
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
