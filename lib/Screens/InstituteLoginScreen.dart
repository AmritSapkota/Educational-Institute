import 'package:educational_institute/Services/navigating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';

class InstituteLogIn extends StatefulWidget {
  @override
  _InstituteLogInState createState() => _InstituteLogInState();
}

class _InstituteLogInState extends State<InstituteLogIn> {
  static final idController = TextEditingController();
  static final passController = TextEditingController();

  Padding loginTextField(
      IconData icon, String txt, double size, bool textObscure) {
    return Padding(
      padding: EdgeInsets.only(left: size, right: size),
      child: TextField(
        keyboardType: txt == 'Password' ? TextInputType.emailAddress : null,
        controller: txt == 'Password' ? passController : idController,
        //this is for password textfield
        obscureText: textObscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          hintText: txt,
          hintStyle: TextStyle(color: Colors.blue),

          //this is how we fill background color
          filled: true,
          fillColor: Colors.grey[100],

          //making boarder of textfield
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),

          //focus border to set border property when clicked
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            //resizeToAvoidBottomInset: false,
            body: Column(
              //NOTE: expanded widget divides flex property to all its child
              children: [
                SvgPicture.asset(
                  'assets/images/EI-logo.svg',
                  height: size.height * 0.2,
                  color: Colors.blue,
                ),
                Text(
                  'Educational Institute',
                  style: TextStyle(
                      fontSize: size.height * 0.04, color: Colors.blue),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.2,
                          ),
                          loginTextField(Icons.account_circle,
                              'Username / Email', size.height * 0.05, false),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          loginTextField(Icons.vpn_key, 'Password',
                              size.height * 0.05, true),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Container(
                            width: size.width * 0.4,
                            height: size.height * 0.05,
                            child: RaisedButton(
                              color: Colors.blue.shade900,
                              onPressed: () {
                                NavigatingScreen().fromInstituteLogInScreen(
                                    context,
                                    idController.text,
                                    passController.text);
                              },
                              shape: RoundedRectangleBorder(

                                  //for rounded border
                                  borderRadius:
                                      BorderRadius.circular(size.height * 0.02),
                                  side: BorderSide(color: Colors.transparent)),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'forget password?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
