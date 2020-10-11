import 'package:educational_institute/Services/navigating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  ButtonTheme loginButton(Size size, String text, Color txtcolor, Color color,
      String buttonType, BuildContext context) {
    return ButtonTheme(
      height: size.height * 0.07,
      minWidth: size.width * 0.5,
      child: FlatButton(
        color: color,
        textColor: txtcolor,
        onPressed: () {
          //navigatingscreen will handel screen navigation
          NavigatingScreen().fromMainScreen(buttonType, context);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          //NOTE: expanded widget divides flex property to all its child
          children: [
            SvgPicture.asset(
              'assets/images/EI-logo.svg',
              height: size.height / 5,
              color: Colors.blue,
            ),
            Text(
              'Educational Institute',
              style:
                  TextStyle(fontSize: size.height * 0.04, color: Colors.blue),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginButton(size, 'Student Login', Colors.blue,
                          Colors.white, 'student', context),
                      SizedBox(
                        height: 15.0,
                      ),
                      loginButton(size, 'Institute Login', Colors.white,
                          Colors.blue, 'institute', context)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
